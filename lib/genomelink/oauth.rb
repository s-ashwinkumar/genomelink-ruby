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
        client.auth_code.authorize_url(redirect_uri: ENV['GENOMELINK_CALLBACK_URL'], scope: scope)
      end

      # [get_token description]
      # @param auth_code [String] This is the code that is returned after use visits and authorizes on the authorization URL
      #
      # @return [String] Access token that can be used to access the genomelink API.
      def get_token(auth_code)
        client.auth_code.get_token(auth_code, redirect_uri: ENV['GENOMELINK_CALLBACK_URL']).token
      end
    end
  end
end
