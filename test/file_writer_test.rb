require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_writer'

class FileWriterTest < Minitest::Test

  def setup
    file_path = 'message.txt'
    @file_writer = FileWriter.new(file_path, "braille.txt")
  end

  def test_it_exists
    assert_instance_of FileWriter, @file_writer
  end

  def test_it_counts_characters
    assert_equal 13, @file_writer.count_characters
  end

  def test_it_reads_file
    assert_equal "hello world \n", @file_writer.read_file
  end

  def test_it_writes_new_file
    new_file = 'braille.txt'
    assert new_file, @file_writer.write_file
    assert_equal "hello world \n", File.read(new_file)
  end

end
