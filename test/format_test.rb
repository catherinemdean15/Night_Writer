require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_writer'
require './lib/output'
require './lib/translation'
require './lib/format'

class FormatTest < Minitest::Test

  def setup
    file_path = 'message.txt'
    @file_writer = FileWriter.new(file_path, "braille.txt")
    @translation = Translation.new(@file_writer.read_file)
    @format = Format.new
  end

  def test_it_exists
    assert_instance_of Format, @format
  end

  def test_join_by_row
    expected = {0=>"0.0.", 1=>"....", 2=>"...."}
    assert_equal expected, @translation.join_by_row
  end

  def test_it_joins_characters
    assert_equal "0.0.\n....\n....", @translation.join_characters
  end

  def test_splits_characters_over_lines
    line = (File.readlines("braille.txt")[1]).length
    assert line < 81
  end

end
