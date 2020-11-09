require './test/test_helper'

class OutputTest < Minitest::Test

  def setup
    @output = Output.new("message.txt", "sample.txt")
  end

  def test_it_exists
    assert_instance_of Output, @output
  end

  def test_it_replies
    File.stubs(:read).returns("hello")
    expected = "Created 'sample.txt' containing 5 characters"
    assert_equal expected, @output.reply
  end

end
