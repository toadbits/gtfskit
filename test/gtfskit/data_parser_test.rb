# frozen_string_literal: true

require "test_helper"

class Gtfskit::DataParserTest < Minitest::Test
  def test_invalid_file_extension
    assert_raises Gtfskit::InvalidExtensionError do
      Gtfskit::DataParser.parse(filepath: "file.rb")
    end
  end

  def test_invalid_dataset_file
    assert_raises Gtfskit::InvalidDatasetFileError do
      Gtfskit::DataParser.parse(filepath: "test.txt")
    end
  end

  def test_generate_instances
    base_dir = "#{Dir.pwd}/resources"

    Gtfskit::DataParser::VALID_FILENAMES.each do |name|
      filepath = "#{base_dir}/agency.txt"

      refute_empty Gtfskit::DataParser.parse(filepath: filepath)
    end
  end
end
