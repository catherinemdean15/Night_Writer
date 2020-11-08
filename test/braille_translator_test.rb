# require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille'

class BrailleTranslatorTest < Minitest::Test

  def setup
    contents = "0.00\n0..0\n..00"
    @braille_translator = BrailleTranslator.new(contents)
  end

  def test_it_exists
    assert_instance_of BrailleTranslator, @braille_translator
  end


end
