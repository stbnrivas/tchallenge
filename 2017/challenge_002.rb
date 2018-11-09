
# 10 frames, each has 2 tries of roll
# 10 pins if knock down 1 pin -> 1 point score
# when knock down 10 pins first roll is call strike
    # If the frame is a strike, the pins knocked down on the next two rolls are awarded as a bonus
# when knock down 10 pins second roll is call spare
    # If the frame is a spare, the pins knocked down on the next roll are awarded as a bonus

# If the frame is a strike, the pins knocked down on the next two rolls are awarded as a bonus

# The 10th frame is a bit special: if it ends up being spare or a strike, the player gets one or two extra rolls

class InputReader
    attr_accessor :games

    def initialize(filename)
        @games = []
        File.open(filename) do |f|
            count_games = f.gets.to_i
            1.upto(count_games) do 
                current_rolls = f.gets.to_i
                current_frames = f.gets.split(" ").map{|x|x.to_i}
                @games.push({rolls:current_rolls,frames:current_frames})
            end
            #puts "count_games(#{count_games}) @games.size(#{@games.size}) "
            raise "Input File Format Error"unless count_games == @games.size
        end
    end
end


class Scorer
    attr_reader :sorted_frames,:score_string
    # attr_reader :sorted_frames,:score_string

    def initialize(rolls_count,frames)
        @sorted_frames = []
        @rolls_count = rolls_count
        while (rolls_count > 0) do 
            first_roll = frames.shift
            if first_roll == 10
                second_roll = nil
                rolls_count -= 1
            else 
                second_roll = frames.shift
                rolls_count -= 2
            end
            @sorted_frames.push([first_roll,second_roll])
        end
    end

    def score()
        @score_string = []
        current_score = 0
        0.upto(9) do |i|
            current_score += points_of_frame(@sorted_frames[i])
            current_score += sum_two_roll_from(i) if strike?(@sorted_frames[i]) 
            current_score += sum_one_roll_from(i) if spare?(@sorted_frames[i]) and not strike?(@sorted_frames[i])
            @score_string.push(current_score)
        end        
        @score_string = @score_string[0,10]
    end

    private

    def points_of_frame(frame)
        # puts "frame[0] #{frame[0]}"
        # puts "frame[1] #{frame[1]}"        
        frame[0]+frame[1].to_i
    end
    

    def strike?(frame)
        frame[0]==10
    end

    def spare?(frame)
        (frame[0]+frame[1].to_i)==10
    end
    
    def sum_one_roll_from(index)        
        return @sorted_frames[index+1].first
    end

    def sum_two_roll_from(index)
        value = @sorted_frames[index+1].first
        unless @sorted_frames[index+1].last.nil?
            value += @sorted_frames[index+1].last            
        else
            value += @sorted_frames[index+2].first            
        end        
        value
    end

end


input = InputReader.new("challenge_002.input")

score1 = Scorer.new(input.games[0][:rolls],input.games[0][:frames])
# puts score1.score().inspect
puts "case\#1: #{score1.score}"

score2 = Scorer.new(input.games[1][:rolls],input.games[1][:frames])
# puts score2.sorted_frames.inspect
# puts score2.score().inspect
puts "case\#2: #{score2.score}"

score3 = Scorer.new(input.games[2][:rolls],input.games[2][:frames])
# puts score3.sorted_frames.inspect
# puts score3.score().inspect
puts "case\#3: #{score3.score}"

score4 = Scorer.new(input.games[3][:rolls],input.games[3][:frames])
# puts score4.sorted_frames.inspect
# puts score4.score().inspect
puts "case\#4: #{score4.score}"

