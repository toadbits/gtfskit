# frozen_string_literal: true

module Gtfskit
  module Dataset
    class Base
      class << self
        def required_fields(*fields)
          @required_fields = fields.to_set
          attr_reader *fields
        end

        def optional_fields(*fields)
          @optional_fields = fields.to_set
          attr_reader *fields
        end
      end

      def initialize(**fields)
        _required_fields = required_fields

        fields.each do |field, value|
          _required_fields.delete(field)
          instance_variable_set("@#{field}", value)
        end

        if !_required_fields.empty?
          raise MissingRequiredFieldsError, "The required fields: #{_required_fields.join(", ")} were not passed as arguments to initialize", caller
        end
      end

      def required_fields
        self.class.instance_variable_get("@required_fields").dup
      end

      def optional_fields
        self.class.instance_variable_get("@optional_fields").dup
      end
    end
  end
end
