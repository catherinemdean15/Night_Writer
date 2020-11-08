class Translation

  def initialize(contents)
    @contents = contents.chars
    @dictionary = { "a" => ["0.", "..", ".."],
                    "b" => ["0.", "0.", ".."],
                    "c" => ["00", "..", ".."],
                    "d" => ["00", ".0", ".."],
                    "e" => ["0.", ".0", ".."],
                    "f" => ["00", "0.", ".."],
                    "g" => ["00", "00", ".."],
                    "h" => ["0.", "00", ".."],
                    "i" => [".0", "0.", ".."],
                    "j" => [".0", "00", ".."],
                    "k" => ["0.", "..", "0."],
                    "l" => ["0.", "0.", "0."],
                    "m" => ["00", "..", "0."],
                    "n" => ["00", ".0", "0."],
                    "o" => ["0.", ".0", "0."],
                    "p" => ["00", "0.", "0."],
                    "q" => ["00", "00", "0."],
                    "r" => ["0.", "00", "0."],
                    "s" => [".0", "0.", "0."],
                    "t" => [".0", "00", "0."],
                    "u" => ["0.", "..", "00"],
                    "v" => ["0.", "0.", "00"],
                    "w" => [".0", "00", ".0"],
                    "x" => ["00", "..", "00"],
                    "y" => ["00", ".0", "00"],
                    "z" => ["0.", ".0", "00"],
                    "!" => ["..", "00", "0."],
                    "." => ["..", "00", ".0"],
                    " " => ["..", "..", ".."],
                    "\n" => [" ", " ", " "]
    }
  end

  def translate
    @contents.map do |character|
      @dictionary[character]
    end
  end

  def join_by_row
    letters = Hash.new("")
    translate.each do |letter|
      letter.each_with_index do |index, character|
        letters[index+1] += letter[index]
      end
    end
    letters
  end

  def join_characters
    letters_by_row = join_by_row
    "#{letters_by_row[1]}\n#{letters_by_row[2]}\n#{letters_by_row[3]}"
  end


end
