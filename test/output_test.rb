require './test/test_helper'

class OutputTest < Minitest::Test

  def setup
    @output = Output.new('braille.txt', 256)
  end

  def test_it_exitst
    assert_instance_of Output, @output
  end

  def test_it_replies
    expected = "Created 'braille.txt' containing 256 characters"
    assert_equal expected , @output.reply
  end

end
