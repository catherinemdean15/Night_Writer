# require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/translation'
require './lib/braille_translator'
require './lib/format'

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
    assert_equal [["0.","..",".."]], translation_3.translate
  end

  def test_braille_complete_letters
    contents = "0.00\n0..0\n..00"
    translation_3 = Translation.new(contents)
    expected = [["0.","0.",".."], ["00",".0","00"]]
    assert_equal expected, translation_3.braille_complete_letters
  end

  def test_it_translates_when_braille
    contents = "0.00\n0..0\n..00"
    translation_3 = Translation.new(contents)
    assert_equal "by", translation_3.translate
  end

  def test_it_fomats_translation_to_braille
    contents = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]
    assert_equal "0.0.0.0.0.\n00.00.0..0\n....0.0.0.\n", @translation.format_translation(contents)
  end

end
