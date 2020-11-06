class Output

  def initialize(new_file_name, character_amount)
    @new_file_name = new_file_name
    @character_amount = character_amount
  end

  def reply
    "Created '#{@new_file_name}' containing #{@character_amount} characters"
  end


end
