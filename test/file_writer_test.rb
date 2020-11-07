require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_writer'

class FileWriterTest < Minitest::Test

  def setup
    file_path = './message.txt'
    @file_writer = FileWriter.new(file_path)
  end

  def test_it_exists
    assert_instance_of FileWriter, @file_writer
  end

end
