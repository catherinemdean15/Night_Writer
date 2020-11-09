module Brailleable

  def braille?
    @contents.chars.all? do |content|
      content == "0" || content == "." || content == "\n" || content == " "
    end
  end

end
