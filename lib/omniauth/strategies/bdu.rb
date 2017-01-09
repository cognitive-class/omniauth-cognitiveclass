require "omniauth-oauth2"

# def make_bdu(app, name, auth_config, success=None, failure=None):
#   '''
#     Enables authentication using BDU.
#     '''
#   config = dict(auth_config)
#   config['request_token_url']    = None
#   config['access_token_method']  = 'POST'
#   config['access_token_url']     = '/oauth2/access_token'
#   config['authorize_url']        = '/oauth2/authorize'
#   config['request_token_params'] = {'scope': 'openid profile email'}
#
#   def _success(resp, auth):
#     session['auth_token'] = (resp['access_token'], '')
#     # fetch public profile
#     user_info = auth.get('/oauth2/user_info').data
#     email     = user_info['email']
#
#     if callable(success):
#       return success(user_info, email)
#     else:
#       return redirect('/')
#
#   return make_oauth(app, name, config, _success, failure)

module OmniAuth
  module Strategies
    class Bdu < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "bdu"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options,
        site:          "https://courses.bigdatauniversity.com/",
        authorize_url: "https://courses.bigdatauniversity.com/oauth2/authorize",
        token_url:     "https://courses.bigdatauniversity.com/oauth2/access_token"

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { raw_info["id"] }

      info do
        {
          name:  raw_info["name"],
          email: raw_info["email"]
        }
      end

      extra do
        {
          "raw_info" => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/me").parsed
      end
    end
  end
end
