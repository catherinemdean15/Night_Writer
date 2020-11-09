require './test/test_helper'

class FileWriterTest < Minitest::Test

  def setup
    file_path = "message.txt"
    @file_writer = FileWriter.new(file_path, "sample.txt")
    @tranlstaion = Translation.new("hi\n")
  end

  def test_it_exists
    assert_instance_of FileWriter, @file_writer
  end

  def test_it_counts_characters
    File.stubs(:read).returns("hello")
    assert_equal 5, @file_writer.count_characters
  end

  def test_it_reads_file
    File.stubs(:read).returns("hello")
    assert_equal "hello", @file_writer.read_file
  end

  def test_it_writes_new_file
    new_file = 'sample.txt'
    assert new_file, @file_writer.write_file
  end

  def test_it_creates_output
    @file_writer.stubs(:count_characters).returns(5)
    assert_equal "Created 'sample.txt' containing 5 characters", @file_writer.create_output
  end

end
