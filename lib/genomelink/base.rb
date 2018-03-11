require 'oauth2'

module Genomelink
  # The Base class for all of the other class.
  # Let other classes inherit from here and put common methods here.
  #
  # @author [ashwin]
  #
  class Base
    class << self
      # Makes a get request to genomelink for the URL given and with the given token.
      #  TODO : use meta programming and define all Restful methods.
      # @param path [String] the path to hit for the request.
      # @param token [String] the access token to be used.
      #
      # @return [Hash] The response Json parsed as a hash.
      def get(path, token)
        service(token).get(path).parsed
      end

      private

      # gets a genomelink API service/client
      # @param token [String] Access token.
      #
      # @return [OAuth2::AccessToken] An initialized AccessToken instance that acts as service client
      def service(token)
        @service ||= OAuth2::AccessToken.new(client,token)
      end

      # gets the Oauth Client object
      #
      # @return [OAuth2::Client] A Oauth Client object.
      def client
        @client ||= OAuth2::Client.new(ENV['GENOMELINK_CLIENT_ID'],ENV['GENOMELINK_CLIENT_SECRET'] , :site => SITE)
      end
    end

    # A constructor to take a hash and assign it to the instance variables
    # @param options = {} [Hash] Could by any class's hash, but the first level keys should be defined in the class
    #
    # @return [Subclass os Base] Returns object of any subclass like Report
    def initialize(options = {})
      options.each do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
    end
  end
end