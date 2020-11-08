require './lib/translation'
require './lib/format'

class FileWriter

  def initialize(file_path, new_file_name)
    @file_path = file_path
    @new_file_name = new_file_name
  end

  def count_characters
    File.read(@file_path).size
  end

  def read_file
    File.read(@file_path)
  end

  def write_file
    translation = Translation.new(read_file)
    format = Format.new(translation)
    new_file = File.new(@new_file_name, "w")
    new_file.write(format.final_string)
    new_file.close
  end

  def create_output
    Output.new(@new_file_name, count_characters).reply
  end

end
