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

end
