# frozen_string_literal: true

require_relative "lib/currency_coin_converter"

Gem::Specification.new do |spec|
  spec.name = "currency_coin_converter"
  spec.version = CurrencyCoinConverter::VERSION
  spec.authors = ["Fernanda de Jesus"]
  spec.email = ["fernandabussular@gmail.com"]

  spec.summary = "A gem for currency conversion using the ExchangeRate API."
  spec.description = "This gem allows you to convert amounts between different currencies using the ExchangeRate API."
  spec.homepage = 'https://github.com/bussularf/currency_coin_converter'
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  # URL do projeto no GitHub
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = 'https://github.com/bussularf/currency_coin_converter'

  # Arquivos incluídos na gem
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.end_with?('currency_converter.gemspec') || f.end_with?('.gem')
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
