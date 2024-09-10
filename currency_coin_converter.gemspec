# frozen_string_literal: true

require_relative "lib/currency_coin_converter/version"

Gem::Specification.new do |spec|
  spec.name = "currency_converter"
  spec.version = CurrencyCoinConverter::VERSION
  spec.authors = ["Fernanda de Jesus"]
  spec.email = ["fernandabussular@gmail.com"]

  spec.summary = "Uma gem para conversão de moedas usando ExchangeRate-API."
  spec.description = "Esta gem permite converter valores entre diferentes moedas usando a API da ExchangeRate."
  spec.homepage = 'https://github.com/bussularf/currency_converter'
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  # URL do projeto no GitHub
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = 'https://github.com/bussularf/currency_converter'

  # Arquivos incluídos na gem
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.end_with?('currency_converter.gemspec') || f.end_with?('.gem')
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Dependências, se houver
  spec.add_dependency "httparty", "~> 0.18"  # Exemplo de dependência para chamadas HTTP
end
