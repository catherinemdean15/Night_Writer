class BrailleTranslator

  def initialize(contents)
    @contents = contents
  end

  def convert_to_rows
    row_and_contents = Hash.new
    @contents.split("\n").each_with_index do |chars, index|
      row_and_contents[index] = chars
    end
    row_and_contents
  end

  def row_to_letter
    row_and_letters = Hash.new
    convert_to_rows.each do |row, contents|
      row_and_letters[row] = contents.scan(/.{2}/)
    end
    row_and_letters
  end

end
