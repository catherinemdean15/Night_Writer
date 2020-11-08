require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_writer'
require './lib/output'
require './lib/translation'

class TranslationTest < Minitest::Test

  def setup
    contents = "aa"
    @translation = Translation.new(contents)
  end

  def test_it_exists
    assert_instance_of Translation, @translation
  end

  def test_it_translates_one_character
    skip
    contents = "a"
    translation_2 = Translation.new(contents)
    assert_equal [["0.","..",".."]], translation_2.translate
  end

  def test_join_by_row
    skip
    expected = {1=>"0..0", 2=>"000.", 3=>"...."}
    assert_equal expected, @translation.join_by_row

  end

  def test_it_joins_characters
    expected = "0..0\n000.\n...."
    assert_equal "0.0.\n....\n....", @translation.join_characters
  end

end