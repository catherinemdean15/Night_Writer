require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_writer'
require './lib/translation'
require './lib/output'
require './lib/format'

class FileWriterTest < Minitest::Test

  def setup
    file_path = 'message.txt'
    @file_writer = FileWriter.new(file_path, "braille.txt")
    @tranlstaion = Translation.new("hi\n")
  end

  def test_it_exists
    assert_instance_of FileWriter, @file_writer
  end

  def test_it_counts_characters
    assert_equal 3, @file_writer.count_characters
  end

  def test_it_reads_file
    assert_equal "hi\n", @file_writer.read_file
  end

  def test_it_writes_new_file
    new_file = 'braille.txt'
    assert new_file, @file_writer.write_file
    assert_equal "0..0\n000.\n.... ", File.read(new_file)
  end

  def test_it_creates_output
    assert_instance_of String, @file_writer.create_output
  end

end
