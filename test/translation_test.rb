require './test/test_helper'

class TranslationTest < Minitest::Test

  def setup
    contents = "aa"
    @translation = Translation.new(contents)
  end

  def test_it_exists
    assert_instance_of Translation, @translation
  end

  def test_braille?
    contents = "0.00\n0..0\n..00"
    translation_2 = Translation.new(contents)
    assert_equal true, translation_2.braille?
  end

  def test_it_translates_one_character
    contents = "a"
    translation_3 = Translation.new(contents)
    assert_equal [["0.","..",".."]], translation_3.translate(contents)
  end

  def test_it_translates_when_braille
    contents = ["0.","..",".."]
    translation_3 = Translation.new(contents)
    translation_3.stubs(:braille?).returns(true)
    assert_equal "a", translation_3.translate(contents)
  end


end
