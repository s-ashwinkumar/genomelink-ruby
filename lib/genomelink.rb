require "genomelink/version"
require "genomelink/base"
require "genomelink/reports"
require "genomelink/oauth"

module Genomelink
  SITE = 'https://genomelink.io'.freeze
  # Path for genomelinke oauth
  OAUTH_PATH = "#{SITE}/oauth/authorize".freeze
end
