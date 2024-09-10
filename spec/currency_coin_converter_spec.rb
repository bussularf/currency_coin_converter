require 'currency_coin_converter'

RSpec.describe CurrencyCoinConverter do
  before do
    allow(ENV).to receive(:[]).with('EXCHANGE_RATE_API_KEY').and_return('fake_key')
  end

  it "converte corretamente entre duas moedas" do
    allow(CurrencyCoinConverter).to receive(:fetch_rates).with("USD").and_return({"EUR" => 0.85})

    result = CurrencyCoinConverter.convert(100, from: "USD", to: "EUR")
    expect(result).to eq(85.0)
  end
end

