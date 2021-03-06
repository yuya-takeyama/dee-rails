# dee-rails

[![Build Status](https://travis-ci.org/yuya-takeyama/dee-rails.png?branch=develop)](https://travis-ci.org/yuya-takeyama/dee-rails)
[![Coverage Status](https://coveralls.io/repos/yuya-takeyama/dee-rails/badge.png?branch=develop)](https://coveralls.io/r/yuya-takeyama/dee-rails?branch=develop)
[![Analytics](https://ga-beacon.appspot.com/UA-12392004-6/yuya-takeyama/dee-rails)](https://github.com/igrigorik/ga-beacon)

[Dee](https://github.com/yuya-takeyama/dee) the DI Container for Rails

## Installation

Add this line to your application's Gemfile:

    gem 'dee-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dee-rails

## Usage

### Defining service provider

Write your service provider using generator.

    $ rails g dee:service_provider foo
    $ vi app/providers/foo_service_provider.rb

```ruby
class FooServceProvider < Dee::Rails::ServiceProvider
  provide do
    # Configuration parameter
    self['foo.name'] = 'FOO'

    # Singleton service
    singleton 'foo' do
      Foo.new self['foo.name']
    end

    # Service
    factory 'bar' do
      Bar.new
    end
  end
end
```

### Using service

You can access services defined in provider using `Dee` object.

```ruby
class FooController < ApplicationController
  def show
    foo = Dee['foo']

    # Some instructions using Foo object
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
