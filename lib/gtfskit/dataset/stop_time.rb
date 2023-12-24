# frozen_string_literal: true

module Gtfskit
  module Dataset
    class StopTime < Base
      required_fields :trip_id, :stop_id, :stop_sequence
      optional_fields :arrival_time, :departure_time, :stop_headsign, :pickup_type, :drop_off_type,
        :continuous_pickup, :continuous_drop_off, :shape_dist_traveled, :timepoint
    end
  end
end
