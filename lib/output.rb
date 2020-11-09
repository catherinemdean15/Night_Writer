class Output

  def initialize(new_file_name, amount_of_characters)
    @new_file_name = new_file_name
    @amount_of_characters = amount_of_characters
  end

  def reply
    "Created '#{@new_file_name}' containing #{@amount_of_characters} characters"
  end

end
