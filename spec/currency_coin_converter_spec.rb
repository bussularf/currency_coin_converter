require 'currency_coin_converter'

require 'json'

RSpec.configure do |config|
  config.before(:example, :mock_get => true) do
    allow_any_instance_of(described_class).to receive(:get).with(path: "INR").and_return(response)
  end
end

RSpec.describe CurrencyCoinConverter::Base do
  let(:response) { JSON.parse(File.read("spec/examples/inr.json")) }
  before do
    described_class.api_key = "fake_key"
  end

  it '#api_key returns the set api key' do
    expect(described_class.api_key).to eq("fake_key")
  end

  it '#api_version returns the initialized api version' do
    expect(described_class.api_version).to eq("v6")
  end

  it '#conversion_rates returns the conversion rate for a valid currency code', :mock_get => true do
    # allow_any_instance_of(described_class).to receive(:get).with(path: "INR").and_return(response)

    expect(described_class.conversion_rates("INR")).to eq(response["conversion_rates"])
  end

  it '#conversion_rate returns the conversion rate for valid currency codes', :mock_get => true do
    # allow_any_instance_of(described_class).to receive(:get).with(path: "INR").and_return(response)

    expect(described_class.conversion_rate(from: "INR", to: "USD")).to eq(response["conversion_rates"]["USD"])
    expect { described_class.conversion_rate(from: "INR", to: "US") }.to raise_error CurrencyCoinConverter::Error, "currency code is invalid: US"
  end

  it '#convert returns the converted amount from one currency code to another', :mock_get => true do
    # allow_any_instance_of(described_class).to receive(:get).with(path: "INR").and_return(response)

    expect(described_class.convert(130, from: "INR", to: "USD")).to eq(1.55)
    expect(described_class.convert(130, from: "INR", to: "USD", round: 1)).to eq(1.5)
    expect(described_class.convert(130, from: "INR", to: "USD", round: 5)).to eq(1.547)
  end
end

