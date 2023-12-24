# frozen_string_literal: true

module Gtfskit
  module Dataset
    class Agency < Base
      required_fields :id, :name, :url, :timezone
      optional_fields :lang, :phone, :fare_url, :email
    end
  end
end
