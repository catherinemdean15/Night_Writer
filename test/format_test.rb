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

  def test_format_line_length
    file_writer_2 = FileWriter.new("long_message.txt", "long_braille.txt")
    translation_2 = Translation.new(file_writer_2.read_file)
    format_2 = Format.new(translation_2)
    line = format_2.format_line_length.values[0].length
    assert line < 81, line
  end

  def test_it_joins_characters
    file_writer_2 = FileWriter.new("long_message.txt", "long_braille.txt")
    translation_2 = Translation.new(file_writer_2.read_file)
    format_2 = Format.new(translation_2)
    assert_equal 12, format_2.join_characters.keys.count
  end

  def test_final_string
    file_writer_2 = FileWriter.new("long_message.txt", "long_braille.txt")
    translation_2 = Translation.new(file_writer_2.read_file)
    format_2 = Format.new(translation_2)
    assert_equal 810, format_2.final_string.size
  end

end
