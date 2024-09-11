require 'json'
require 'net/http'
require 'singleton'
require 'uri'

module CurrencyCoinConverter
  VERSION = "0.3.0"

  class Error < StandardError; end

  class Base
    include ::Singleton

    def initialize
      self.api_version = "v6"
    end

    def convert(amount, from:, to:, round: 2)
      (amount * conversion_rate(from:, to:)).round(round)
    end

    def conversion_rate(from:, to:)
      conversion_rate = conversion_rates(from)[to]
      return conversion_rate unless conversion_rate.nil?

      raise Error, "currency code is invalid: #{to}"
    end

    def conversion_rates(base_currency)
      get(path: base_currency)["conversion_rates"]
    end

    attr_accessor :api_key
    attr_reader :api_version

    private

    attr_writer :api_version

    def get(path:)
      raise Error, "api key should be present" if api_key.strip.empty?
      raise Error, "api version should be present" if api_version.strip.empty?

      uri = ::URI::HTTPS.build(host: "#{api_version}.exchangerate-api.com", path: "/#{api_version}/#{api_key}/latest/#{path}")
      response = ::Net::HTTP.get_response(uri)
      parsed_response = JSON.parse(response.body)

      return parsed_response if response.is_a?(::Net::HTTPSuccess)

      raise Error, "#{parsed_response["error-type"]}: could not complete the request."
    end

    class << self
      def api_key
        instance.api_key
      end

      def api_key=(api_key)
        instance.api_key = api_key
      end

      def api_version
        instance.api_version
      end

      def convert(amount, from:, to:, round: 2)
        instance.convert(amount, from:, to:, round: round)
      end

      def conversion_rate(from:, to:)
        instance.conversion_rate(from:, to:)
      end

      def conversion_rates(base_currency)
        instance.conversion_rates(base_currency)
      end
    end
  end
end
