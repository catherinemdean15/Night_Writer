require './lib/braille_to_english_format'
require './lib/english_to_braille_format'
require './lib/output'
require './lib/brailleable'

class FileWriter
  include Brailleable

  def initialize(file_path, new_file_name)
    @file_path = file_path
    @new_file_name = new_file_name
    @contents = File.read(@file_path)
  end

  def count_characters
    [File.read(@new_file_name).size, File.read(@file_path).size].min_by do |file|
      file
    end
  end

  def read_file
    @contents
  end

  def write_file
    (translation = BrailleToEnglishFormat.new(@contents) if braille?) ||
    (translation = EnglishToBrailleFormat.new(@contents))
    new_file = File.new(@new_file_name, "w")
    new_file.write(translation.format_translation)
    new_file.close
  end

  def create_output
    Output.new(@new_file_name, count_characters).reply
  end

end
