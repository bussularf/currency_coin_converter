RSpec.describe CurrencyConverter do
  it "converte corretamente entre duas moedas" do
    allow(CurrencyConverter).to receive(:fetch_rates).with("USD").and_return({"EUR" => 0.85})
    
    result = CurrencyConverter.convert(100, from: "USD", to: "EUR")
    expect(result).to eq(85.0)
  end
end
