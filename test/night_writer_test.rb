require './test/test_helper'

def test_it_writes_file
  new_file = 'braille.txt'
  assert new_file, @file_writer.write_file
end

def test_it_creates_output
  @file_writer.stubs(:count_characters).returns(5)
  assert_equal "Created 'sample.txt' containing 5 characters", @file_writer.create_output
end
