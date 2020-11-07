require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_writer'
require './lib/output'
require './lib/translation'

class TranslationTest < Minitest::Test

  def setup
    contents = "a"
    @tranlsation = Translation.new(contents)
  end

  def test_it_exists
    assert_instance_of Translation, @tranlsation
  end

end
