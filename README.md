# CurrencyCoinConverter
Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/currency_coin_converter`. To experiment with that code, run `bin/console` for an interactive prompt.

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bussularf/currency_coin_converter.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CurrencyConverter project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/bussularf/currency_coin_converter/blob/master/CODE_OF_CONDUCT.md).
