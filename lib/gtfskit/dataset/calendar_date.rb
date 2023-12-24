# frozen_string_literal: true

module Gtfskit
  module Dataset
    class CalendarDate < Base
      required_fields :service_id, :date, :exception_type
    end
  end
end
