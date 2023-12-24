# frozen_string_literal: true

module Gtfskit
  module Dataset
    class Calendar < Base
      required_fields :service_id, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :start_date, :end_date
    end
  end
end
