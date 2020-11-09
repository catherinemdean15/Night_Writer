class BrailleTranslator

  def initialize(contents)
    @contents = contents
  end

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

end
