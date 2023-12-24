# frozen_string_literal: true

require "test_helper"

class Gtfskit::Dataset::FactoryTest < Minitest::Test
  class TestClass < Gtfskit::Dataset::Base
    required_fields :required_field
    optional_fields :optional_field
  end

  def test_initialize_from
    dataset = Gtfskit::Dataset::Factory.initialize_from(dataset: :agency, id: "test", name: "test", url: "test", timezone: "test")
    assert_equal Gtfskit::Dataset::Agency, dataset.class
  end

  def test_initialize_from_fails_with_invalid_dataset
    assert_raises NameError do
      Gtfskit::Dataset::Factory.initialize_from(dataset: :invalid)
    end
  end
end
