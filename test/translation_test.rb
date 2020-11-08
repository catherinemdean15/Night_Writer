require './test/test_helper'

class TranslationTest < Minitest::Test

  def setup
    contents = "aa"
    @translation = Translation.new(contents)
  end

  def test_it_exists
    assert_instance_of Translation, @translation
  end

  def test_it_translates_one_character
    contents = "a"
    translation_2 = Translation.new(contents)
    assert_equal [["0.","..",".."]], translation_2.translate
  end

end
