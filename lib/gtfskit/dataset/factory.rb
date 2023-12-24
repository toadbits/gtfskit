# frozen_string_literal: true

module Gtfskit
  module Dataset
    class Factory
      DATASET = {
        :agency         => Gtfskit::Dataset::Agency,
        :calendar       => Gtfskit::Dataset::Calendar,
        :calendar_date  => Gtfskit::Dataset::CalendarDate,
        :calendar_dates => Gtfskit::Dataset::CalendarDate,
        :route          => Gtfskit::Dataset::Route,
        :routes         => Gtfskit::Dataset::Route,
        :stop           => Gtfskit::Dataset::Stop,
        :stops          => Gtfskit::Dataset::Stop,
        :stop_time      => Gtfskit::Dataset::StopTime,
        :stop_times     => Gtfskit::Dataset::StopTime,
        :trip           => Gtfskit::Dataset::Trip,
        :trips          => Gtfskit::Dataset::Trip
      }

      class << self
        def initialize_from(dataset:, **fields)
          klass = DATASET[dataset.to_sym]
          raise NameError, "Invalid dataset '#{dataset}' passed to factory.", caller if klass.nil?
          klass.new(**fields)
        end
      end
    end
  end
end
