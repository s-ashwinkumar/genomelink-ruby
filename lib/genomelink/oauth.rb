module Genomelink
  # Oauth class to take care of the Oauth 2.0 with genomelink APIs
  #
  # @author [ashwin]
  #
  class Oauth < Base
    class << self
      # Used to get the redirect URL to Genomelink where user can authorize an app.
      # @param scope [String] Space delimited list of scopes that specify what the user can access
      #   EXAMPLE : "report:bmi report:longevity"
      # This should be within the ones selected during the registering the client application.
      #
      # @return [String] URL where user needs to be redirected for authorization
      def authorization_url(scope)
        client.auth_code.authorize_url(redirect_uri: get_config('GENOMELINK_CALLBACK_URL'), scope: scope)
      end

      # [get_token description]
      # @param auth_code [String] This is the code that is returned after use visits and authorizes on the authorization URL
      #
      # @return [String] Access token that can be used to access the genomelink API.
      def get_token(auth_code)
        client.auth_code.get_token(auth_code, redirect_uri: get_config('GENOMELINK_CALLBACK_URL')).token
      end

      private
      # gets the Oauth Client object
      #
      # @return [OAuth2::Client] A Oauth Client object.
      def client
        @client ||= OAuth2::Client.new( get_config('GENOMELINK_CLIENT_ID'),
          get_config('GENOMELINK_CLIENT_SECRET'),
          :site => OAUTH_PATH
        )
      end

      # gets a gicen env variable, checks for existence and throws exception if not present
      # @param config_name [String] key of the env variable
      #
      # @return [String] value of the env variable
      def get_config(config_name)
        raise ConfigNotFound, "Environment variable #{config_name} not found !" unless ENV[config_name]
        ENV[config_name]
      end
    end
  end
end
