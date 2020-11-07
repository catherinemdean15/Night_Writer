class Translation

  def initialize(contents)
    @contents = contents.chars
    @dictionary = { "a" => ["0.","..",".."],
                    "b" => "0.\n0.\n..",
                    "c" => "00\n..\n..",
                    "d" => "00\n.0\n..",
                    "e" => "0.\n.0\n..",
                    "f" => "00\n0.\n..",
                    "g" => "00\n00\n..",
                    "h" => ["0.","00",".."],
                    "i" => [".0","0.",".."],
                    "j" => ".0\n00\n..",
                    "k" => "0.\n..\n0.",
                    "l" => "0.\n0.\n0.",
                    "m" => "00\n..\n0.",
                    "n" => "00\n.0\n0.",
                    "o" => "0.\n.0\n0.",
                    "p" => "00\n0.\n0.",
                    "q" => "00\n00\n0.",
                    "r" => "0.\n00\n0.",
                    "s" => ".0\n0.\n0.",
                    "t" => ".0\n00\n0.",
                    "u" => "0.\n..\n00",
                    "v" => "0.\n0.\n00",
                    "w" => ".0\n00\n.0",
                    "x" => "00\n..\n00",
                    "y" => "00\n.0\n00",
                    "z" => "0.\n.0\n00",
                    "!" => "..\n00\n0.",
                    "." => "..\n00\n.0"

    }
  end

  def translate
    @contents.map do |character|
      @dictionary[character]
    end
  end

  def join_by_row
    translate.each_with_object({}) do |letter, breakdown|
      count = 1
      3.times do
        (breakdown[count] << letter[0] if breakdown[count]) ||
        (breakdown[count] = letter[0])
        count += 1
        letter.shift
      end
    end
  end

  def join_characters
    # require "pry"; binding.pry
    join_by_row
  end


end
