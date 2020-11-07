require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_writer'
require './lib/output'
require './lib/translation'

class TranslationTest < Minitest::Test

  def setup
    contents = "a"
    @translation = Translation.new(contents)
  end

  def test_it_exists
    assert_instance_of Translation, @translation
  end

  def test_it_translates_one_character
    assert_equal "0..\n...\n...\n", @translation.translate
  end

end
