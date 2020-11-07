require './lib/output'
require './lib/file_writer'

@file_names = []
ARGV.map do |argument|
  @file_names << argument
end


file_writer = FileWriter.new(@file_names[0], @file_names[1])
file_writer.write_file
p file_writer.create_output
