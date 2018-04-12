
# GENOME LINK Ruby Gem

Ruby gem library to quickly get started with the GENOME LINK API. This supports both the authentication mechanisms, token based and OAuth 2.0.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'genomelink-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install genomelink-ruby

## Usage/Examples
Example Usage for calling the reports API with oAuth token
```ruby
2.4.2 :001 > require 'genomelink'
 => true
2.4.2 :002 > result = Genomelink::Report.fetch("eye-color","GENOMELINKTEST001")
 => #<Genomelink::Report:0x00007f87b41fb010 @phenotype={"url_name"=>"eye-color", "display_name"=>"Genetic eye color", "category"=>"trait"}, @population="european", @scores=[{"score"=>0, "text"=>"Tend to not have brown eyes"}, {"score"=>1, "text"=>"Tend to not have brown eyes, slightly"}, {"score"=>2, "text"=>"Intermediate"}, {"score"=>3, "text"=>"Slight tendency for brown eyes"}, {"score"=>4, "text"=>"Stronger tendency for brown eyes"}], @summary={"score"=>0, "text"=>"Tend to not have brown eyes", "warnings"=>[]}>
2.4.2 :003 > result.summary
 => {"score"=>0, "text"=>"Tend to not have brown eyes", "warnings"=>[]}
```

Example Usage for oAuth -
```ruby
# To get the redirect URL :
redirect_url = Genomelink::Oauth.authorization_url("report:eye-color")
# Redirect user to the above URL.
# After authentication user control reaches the callback URL with code.
# Use the code from the parameters and request a token
token = Genomelink::Oauth.get_token(params[:code])
# This token can be used to call the reports API as given above.
# Store this token and if it expired use the code again to get a new token.
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. To run only the unit tests, run the specs in `spec/unit`. The integration specs which reach out to genomelink are in `spec/integration`

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/s-ashwinkumar/genomelink-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
