require './lib/translation'

class BrailleToEnglishFormat < Translation

  def convert_to_rows
    row_and_contents = Hash.new
    @contents.split("\n").each_with_index do |characters, index|
      row_and_contents[index] = characters
    end
    row_and_contents
  end

  def row_to_letter
    row_and_letters = Hash.new
    convert_to_rows.each do |row, characters|
      row_and_letters[row] = characters.scan(/.{2}/)
    end
    row_and_letters
  end

  def complete_letters
    letters = []
    row_to_letter.each do |row, letter|
      letter.each_with_index do |characters, index|
        (letters[index] << characters if letters[index]) ||
        (letters[index] = [characters])
      end
    end
    letters
  end

  def formatted_complete_letters
    formatted_letters = complete_letters
    until formatted_letters.all? {|letter| letter.length < 4}
        formatted_letters.each_with_index do |letter, index|
          if letter.length > 3
            first_letter = letter.each_slice(3).to_a
            second_letter = first_letter[1]
            formatted_letters << second_letter
            first_letter.pop
            formatted_letters[index] = first_letter.flatten
          end
        end
    end
    formatted_letters
  end

  def format_translation
    translate(formatted_complete_letters)
  end

end
