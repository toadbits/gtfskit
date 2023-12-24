# gtfskit

`gtfskit` is a Ruby library for the General Transit Feed Specification (GTFS). The library is in development and is not stable for production use. However, PRs and issues are welcome. Thank you for using the gem!

## Installation
Install the gem and add to the application's Gemfile by executing:

    $ bundle add gtfskit

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install gtfskit

## Usage

```ruby
require "gtfskit"

# The `filepath` argument receives a valid dataset filepath
# See: https://gtfs.org/schedule/reference/#dataset-files
dataset = Gtfskit::DataParser.parse(filepath: "agency.txt")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/toadbits/gtfskit.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
