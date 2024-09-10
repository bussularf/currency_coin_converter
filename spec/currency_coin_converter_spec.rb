# spec/currency_coin_converter_spec.rb
require 'currency_coin_converter'

RSpec.describe CurrencyCoinConverter do
  it "converte corretamente entre duas moedas" do
    allow(CurrencyCoinConverter).to receive(:fetch_rates).with("USD").and_return({"EUR" => 0.85})

    result = CurrencyCoinConverter.convert(100, from: "USD", to: "EUR")
    expect(result).to eq(85.0)
  end
end
