require 'pry'

class ShortestSequence

  def initialize(line)
    @line = line
    @phrase
    @phrase_searchable
    @keywords
    @keywords_locations_array = []
    @keyword_combinations
    @shortest_distance_combination
  end

  def shortest_sequence
    isolate_phrase_and_keywords
    convert_phrase_to_array
    find_keyword_indices
    create_array_of_permutations
    calculate_shortest_keyword_distance
    return_shortest
  end

  def isolate_phrase_and_keywords
    components = @line.split(' | ')
    @phrase = components[0]
    @phrase_searchable = components[0].downcase
    @keywords = components[1].downcase.split(" ")
  end

  def convert_phrase_to_array
    @phrase_searchable.scan(/\+w/)
  end

  def find_keyword_indices
    @keywords.each do |n|
      @keywords_locations_array << @phrase_searchable.enum_for(:scan, /#{n}/).map { Regexp.last_match.begin(0) }
    end
  end

  def create_array_of_permutations
    head, *rest = @keywords_locations_array
    @keyword_combinations = head.product(*rest)
  end

  def calculate_shortest_keyword_distance
    options = @keyword_combinations.map { |n| n.sort.last - n.sort.first }
    shortest_distance = options.sort.first
    magic_number = options.index(shortest_distance)
    @shortest_distance_combination = @keyword_combinations[6]
  end

  def return_shortest
    puts "#{@phrase[@shortest_distance_combination.sort.first..@shortest_distance_combination.sort.last]}"
  end

end