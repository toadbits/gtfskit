# frozen_string_literal: true

module Gtfskit
  module Dataset
    class Trip < Base
      required_fields :id, :route_id, :service_id
      optional_fields :headsign, :short_name, :direction_id, :block_id, :shape_id, :wheelchair_accessible, :bikes_allowed
    end
  end
end
