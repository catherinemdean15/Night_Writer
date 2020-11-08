require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_writer'
require './lib/output'
require './lib/translation'
require './lib/format'

class FormatTest < Minitest::Test

  def setup
    file_path = "short_message.txt"
    @file_writer = FileWriter.new(file_path, "braille.txt")
    @translation = Translation.new(@file_writer.read_file)
    @format = Format.new(@translation)
  end

  def test_it_exists
    assert_instance_of Format, @format
  end

  def test_join_by_row
    expected = {0=>"0.0.0.0.0....00.0.0.00.. ", 1=>"00.00.0..0..00.0000..000 ", 2=>"....0.0.0....00.0.0...0. "}
    assert_equal expected, @format.join_by_row
  end

  def test_it_joins_characters
    assert_equal "0.0.0.0.0....00.0.0.00.. \n00.00.0..0..00.0000..000 \n....0.0.0....00.0.0...0. ", @format.join_characters
  end

  def test_splits_characters_over_lines
    line = (File.readlines("braille.txt")[1]).length
    assert line < 81
  end

end
