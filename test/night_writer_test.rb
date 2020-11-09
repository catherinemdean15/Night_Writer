require './test/test_helper'

def test_it_writes_file
  new_file = 'braille.txt'
  assert new_file, @file_writer.write_file
end
