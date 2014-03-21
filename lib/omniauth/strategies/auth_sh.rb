require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class AuthSh < OmniAuth::Strategies::OAuth2

      option :name, "auth_sh"
      option :client_options, {
        :site => "http://localhost:3000",
        :authorize_url => "/authorize",
        :token_url => "/token"
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        {
          :name => raw_info['accounts'].first['name'],
          :email => raw_info['accounts'].first['email'],
          :picture => raw_info['accounts'].first['picture']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end

    end
  end
end
