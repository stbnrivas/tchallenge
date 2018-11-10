# Px Px Px
# input: 
#      given maximun possible score of game: 
#      dont want game repeated cards
#      how many cards we need?
# tell us the size of the smallest set of cards that, for any number from 1 to P


class InputReader
    attr_reader :cases
    def initialize(filename)
        @cases = []
        File.open(filename,"r") do |f|
            case_count = f.gets.to_i
            1.upto(case_count) do |i|
                @cases.push(f.gets.to_i)
            end
        end        
    end
end


class DeckOptimizer
    def initialize(max_points)
        @max_points = max_points
        @numbers_set = (1..max_points).step(1).to_a
    end

    def minimum_card
        i = 0   
        deck = Array.new()
        loop do
            deck.push(@numbers_set[i])
            break if can_generate_all_points_until?(@max_points,deck)
            i=i+1 
        end
        deck.size
    end

    def can_generate_all_points_until?(max_points,with_this_deck)
        acumulator = with_this_deck.reduce(:+)
        acumulator >= max_points
    end
end



reader = InputReader.new("challenge_003.input")
cases_to_optimize = reader.cases

i = 1
cases_to_optimize.each do |c|
    deck = DeckOptimizer.new(c)    
    puts "Case \##{i}: #{deck.minimum_card()}" 
    i = i+1
end


