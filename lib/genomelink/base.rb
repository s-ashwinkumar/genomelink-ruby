require 'oauth2'

module Genomelink
  class ConfigNotFound < StandardError; end
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
        result = service(token).get do |req|
          req.url path
          req.headers['Authorization'] = "BEARER #{token}"
        end
        JSON.parse(result.body)
      end

      private

      # gets a genomelink API service/client
      # @param token [String] Access token.
      #
      # @return [OAuth2::AccessToken] An initialized AccessToken instance that acts as service client
      def service(token)
        @service ||= Faraday.new(url: SITE)
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