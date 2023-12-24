# frozen_string_literal: true

module Gtfskit
  module Dataset
    class Route < Base
      required_fields :id
      optional_fields :agency_id, :short_name, :long_name, :desc, :type, :url, :color,
        :text_color, :sort_order, :continuous_pickup, :continuous_drop_off, :network_id
    end
  end
end
