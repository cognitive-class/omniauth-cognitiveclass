# omniauth-bdu

`omniauth-bdu` is a strategy (plugin or extension) for OmniAuth, which is a 
Ruby authentication library. OmniAuth integrates transparently with Devise, 
a popular Rails authentication solution.

BDU is [Big Data University](https://courses.bigdatauniversity.com/).

## Usage with Devise

Add this to your Gemfile:

```ruby
# You need to do this first:
# bundle config na.artifactory.swg-devops.com <USERNAME>:<PASSWORD>
# with your intranet credentials
#
# Substitute %40 for the @ in your username
# e.g. leonsp%40ca.ibm.com
#
source "https://na.artifactory.swg-devops.com/artifactory/api/gems/apset-ruby/" do
  gem "omniauth-bdu", "~> 0.3.17"
end
```

Add this to your `config/initializers/devise.rb`:

```ruby
callback_url = "http://#{ENV.fetch('ATELIER_HOST')}:#{ENV.fetch('ATELIER_PORT')}/users/auth/bdu/callback"

config.omniauth :bdu, ENV.fetch("BDU_ID"), ENV.fetch("BDU_SECRET"),
  callback_url:           callback_url,
  provider_ignores_state: true
```

Follow the other steps from the [Devise OmniAuth Guide](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview).

## See Also

*   <https://github.com/omniauth/omniauth/wiki>
*   <https://github.com/intridea/omniauth-oauth2>
