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
    letters_by_row = join_by_row
    "#{letters_by_row[0]}\n#{letters_by_row[1]}\n#{letters_by_row[2]}"
  end

end
