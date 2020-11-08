class Format

  def initialize(translation)
    @translation = translation
  end

  def join_by_row
    letters = Hash.new("")
    @translation.translate.each do |letter|
      letter.each_with_index do |character, index|
        letters[index] += letter[index]
      end
    end
    letters
  end

  def join_characters
    final_string = ""
    complete_translation = Hash.new("")
    format_line_length.each do |row, characters|
      3.times do
      characters.each_with_index do |line, index|
        # require "pry"; binding.pry
        complete_translation[(index * 3) + row] += line
      end
      end
    end
    require "pry"; binding.pry
    complete_translation
    "#{letters_by_row[0]}\n#{letters_by_row[1]}\n#{letters_by_row[2]}"
  end

  def format_line_length
    short_rows = Hash.new
    join_by_row.each_with_index do |characters, row|
      short_rows[row] = characters[1].scan(/.{1,80}/)
    end
    short_rows
  end

end
