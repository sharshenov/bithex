# Bithex [![Build Status](https://travis-ci.org/sharshenov/bithex.svg?branch=master)](https://travis-ci.org/sharshenov/bithex) [![Gem Version](https://badge.fury.io/rb/bithex.svg)](https://badge.fury.io/rb/bithex)

Store hex strings as [PostgreSQL bit strings](https://edgeguides.rubyonrails.org/active_record_postgresql.html#bit-string-types) to reduce column size 2x.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bithex'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bithex

## Usage

Create column

```
create_table :uploads do |t|
  t.column :digest, "bit(160)" # For SHA1 limit is 160, for MD5 limit is 128
end
```

Define bithex attributes

```ruby
class Upload < ActiveRecord::Base
  bithex :digest

  # if you have multiple attributes to store as bit string
  # bithex :foo, :bar, :baz
end
```

Treat you bithex attribute as usual string, but remember: string length is hardcoded by limit of bit column (40 for SHA1, 32 for MD5)

```ruby
upload = Upload.new
upload.digest = Digest::SHA1.hexdigest('foo bar baz') # c7567e8b39e2428e38bf9c9226ac68de4c67dc39
upload.save
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bithex.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
