module Genomelink
  # Report class to represent the reports API
  #
  # @author [ashwin]
  #
  class Report < Base
    attr_accessor :summary, :phenotype, :population, :scores
    class << self
      # Method to get the report for a given trait.
      # @param trait [String] A particular trait to fetch details for.
      # @param token [Sting] Access token to be used.
      #
      # @return [Report] A report object with summary, phenotype, population and scores.
      def fetch(trait, token)
        new get(path_to_trait(trait), token)
      end

      private
      # Method to return the path to hit to get report of a trait
      # @param trait [String] A particular trait to fetch details for.
      #
      # @return [String] path for the URL/request
      def path_to_trait(trait)
        "/v1/reports/#{trait}?population=european"
      end
    end
  end
end
