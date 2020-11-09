require './lib/file_writer'

class Output < FileWriter

  def initialize(file_path, new_file_name)
    @file_path = file_path
    @new_file_name = new_file_name
  end

  def reply
    "Created '#{@new_file_name}' containing #{count_characters} characters"
  end

end
