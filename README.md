# omniauth-cognitiveclass

`omniauth-cognitiveclass` is a strategy (plugin or extension) for OmniAuth, 
which is a Ruby authentication library. OmniAuth integrates transparently 
with Devise, a popular Rails authentication solution.

[Cognitive Class](https://courses.cognitiveclass.ai/) is also known as Big
Data University. It's based on the OpenEdx platform

## Usage with Devise

Add this to your Gemfile:

```ruby
gem "omniauth-cognitiveclass", "~> 0.4.0"
```

Install the gem:

```bash 
bundle install
```

Define these environment variables for your Ruby application:

```bash
export COGNITIVE_SITE="https://courses.cognitiveclass.ai/"
export COGNITIVE_AUTHORIZE_URL="https://courses.cognitiveclass.ai/oauth2/authorize"
export COGNITIVE_TOKEN_URL="https://courses.cognitiveclass.ai/oauth2/access_token"

export COGNITIVE_ID="..."
export COGNITIVE_SECRET="..."
```

Add this to your `config/initializers/devise.rb`:

```ruby
callback_url = "http://#{ENV.fetch('ATELIER_HOST')}:#{ENV.fetch('ATELIER_PORT')}/users/auth/bdu/callback"

config.omniauth :cognitive_class, ENV.fetch("COGNITIVE_ID"), ENV.fetch("COGNITIVE_SECRET"),
  callback_url:           callback_url,
  provider_ignores_state: true
```

Follow the other steps from the [Devise OmniAuth Guide](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview).

## See Also

*   <https://github.com/omniauth/omniauth/wiki>
*   <https://github.com/intridea/omniauth-oauth2>
