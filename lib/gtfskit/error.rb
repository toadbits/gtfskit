# frozen_string_literal: true

module Gtfskit
  class Error < StandardError; end
  class InvalidExtensionError < Error; end
  class InvalidDatasetFileError < Error; end
  class MissingRequiredFieldsError < Error; end
end
