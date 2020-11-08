# require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/translation'

class TranslationTest < Minitest::Test

  def setup
    contents = "aa"
    @translation = Translation.new(contents)
  end

  def test_it_exists
    assert_instance_of Translation, @translation
  end

  def test_braille?
    contents = "0.\n..\n.."
    translation_2 = Translation.new(contents)
    assert_equal true, translation_2.braille?
  end

  def test_it_translates_one_character
    contents = "a"
    translation_3 = Translation.new(contents)
    assert_equal [["0.","..",".."]], translation_3.translate
  end

end
