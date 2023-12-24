# frozen_string_literal: true
require "debug"

module Gtfskit
  class DataParser
    VALID_FILENAMES = %w(
      agency stops routes trips stop_times calendar calendar_dates fare_attributes 
      fare_rules timeframes fare_media fare_products fare_leg_rules fare_transfer_rules 
      areas stop_areas networks route_networks shapes frequencies transfers pathways 
      levels translations feed_info attributions
    ).to_set

    ATTRIBUTE_PREFIX = {
      "agency"          => "agency_",
      "calendar"        => "",
      "calendar_dates"  => "",
      "stops"           => "stop_",
      "stop_times"      => "",
      "routes"          => "route_",
      "trips"           => "trip_"
    }

    class << self
      def parse(filepath:)
        validate_filepath(filepath)
        generate_instances(filepath)
      end

      private

      def generate_instances(filepath)
        dataset = infer_dataset(filepath)

        prefix = ATTRIBUTE_PREFIX[dataset]
        enumerator = File.foreach(filepath)
        fields = enumerator.first.strip.split(",")

        enumerator.each_with_index.filter_map do |row, i|
          next if i == 0

          attrs = row.split(",").each_with_object({}).with_index do |(value, hash), col|
            value.strip!
            next if value.empty?

            field = fields[col].delete_prefix(prefix).to_sym
            hash[field] = value
          end

          Gtfskit::Dataset::Factory.initialize_from(dataset: dataset, **attrs)
        end
      end

      def infer_dataset(filepath)
        File.basename(filepath, ".txt")
      end

      def validate_filepath(filepath)
        if not_text_file?(filepath)
          raise InvalidExtensionError, "Invalid file extension. Only .txt files are permitted", caller
        end

        if invalid_filename?(filepath)
          raise InvalidDatasetFileError, "The given file is not a valid GTFS dataset file. Valid filenames (with the .txt extension): #{VALID_FILENAMES.join(", ")}", caller
        end
      end

      def not_text_file?(filepath)
        File.extname(filepath) != ".txt"
      end

      def invalid_filename?(filepath)
        !VALID_FILENAMES.include?(File.basename(filepath, ".txt"))
      end
    end
  end
end
