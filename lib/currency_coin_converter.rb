require_relative 'currency_coin_converter/version'
require 'httparty'

module CurrencyCoinConverter
  class Error < StandardError; end

  API_URL = "https://v6.exchangerate-api.com/v6/943cde42b6f9a6628b0900ec/latest/"

  def self.convert(amount, from:, to:)
    rates = fetch_rates(from)
    conversion_rate = rates[to]

    if conversion_rate
      (amount * conversion_rate).round(2)
    else
      raise "Conversão de #{from} para #{to} não encontrada."
    end
  end

  def self.fetch_rates(base_currency)
    response = HTTParty.get("#{API_URL}/#{base_currency}")
    if response.success?
      response.parsed_response["conversion_rates"]
    else
      raise "Erro ao buscar taxas de câmbio."
    end
  end
end
