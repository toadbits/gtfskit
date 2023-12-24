# frozen_string_literal: true

require "test_helper"

class Gtfskit::Dataset::BaseTest < Minitest::Test
  class TestClass < Gtfskit::Dataset::Base
    required_fields :required_field
    optional_fields :optional_field
  end

  def test_fails_without_required_fields
    assert_raises Gtfskit::MissingRequiredFieldsError do
      TestClass.new
    end
  end

  def test_required_fields
    assert TestClass.new(required_field: "foo").respond_to?(:required_field)
  end

  def test_optional_fields
    assert TestClass.new(required_field: "foo").respond_to?(:optional_field)
  end
end
