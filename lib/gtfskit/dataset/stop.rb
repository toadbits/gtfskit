# frozen_string_literal: true

module Gtfskit
  module Dataset
    class Stop < Base
      required_fields :id
      optional_fields :code, :name, :tts_stop_name, :desc, :lat, :lon, :zone_id,
        :stop_url, :location_type, :parent_station, :timezone, :wheelchair_boarding, 
        :level_id, :platform_code
    end
  end
end
