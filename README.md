# CurrencyCoinConverter

## Installation
Install the gem and add to the application's Gemfile by executing:

    $ bundle add currency_coin_converter

Or add in your Gemfile 
    `gem 'currency_coin_converter'`
Run in console 
    `bundle install`

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install currency_coin_converter

## Usage

`require 'currency_coin_converter'`

`amount_in_euros = CurrencyCoinConverter.convert(100, from: "USD", to: "EUR")`
`puts amount_in_euros`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bussularf/currency_coin_converter.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CurrencyConverter project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/bussularf/currency_coin_converter/blob/master/CODE_OF_CONDUCT.md).
