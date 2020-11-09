class Format

  def initialize(translation)
    @translation = translation
  end

  def join_by_row
    letters = Hash.new("")
    @translation.each do |letter|
      letter.each_with_index do |character, index|
        letters[index] += letter[index]
      end
    end
    letters
  end

  def format_line_length
    short_rows = Hash.new
    join_by_row.each_with_index do |characters, row|
      short_rows[row] = characters[1].scan(/.{1,80}/)
    end
    short_rows
  end

  def join_characters
    complete_translation = Hash.new("")
    format_line_length.each do |row, characters|
      characters.each_with_index do |line, index|
          complete_translation[(index * 4) + row] += line
      end
    end
    complete_translation
  end

  def final_string
    complete_string = ""
    range = 0..join_characters.keys.max
    range.each do |row|
      complete_string += "#{join_characters[row]}\n"
    end
    complete_string
  end

end
