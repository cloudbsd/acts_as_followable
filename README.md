# Acts As Followable

This plugin provides a simple way to follow users.

- Allow any model to be followed.
- Allow any model to follow. In other words, follower do not have to come from a user, they can come from any model (such as a Group or Team).
- Provide an easy to follow/unfollow syntax.

## Installation

### Rails 4+

Add this line to your application's Gemfile:

    gem 'acts_as_followable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_followable

### Database Migrations

    $ rails generate acts_as_followable:migration
    $ rake db:migrate

## Usage

### Followable Models


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
