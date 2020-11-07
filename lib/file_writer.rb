class FileWriter

  def initialize(file_path)
    @file_path = file_path
    @contents = nil
  end

  def read_file
    File.read(@file_path)
  end

  def write_file
    new_file = File.new("braille.txt", "w")
    new_file.write(read_file)
    new_file.close
  end

end
