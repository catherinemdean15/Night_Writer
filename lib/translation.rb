class Translation

  def initialize(contents)
    @contents = contents.chars
    @dictionary = { "a" => "0..\n...\n...\n"}
  end

  def translate
    array = @contents.map do |character|
      @dictionary[character]
    end.join()
  end


end
