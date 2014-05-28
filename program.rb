require_relative 'shortest_sequence'

File.foreach(ARGV[0]) do |line|
  sequence = ShortestSequence.new(line).shortest_sequence
  print sequence
end