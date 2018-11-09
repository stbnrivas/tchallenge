
# z lines numbers of simulation_case
# first line N guess
# second line S1 S2 S3 ... until N guess




class ReaderInput
    attr_reader :size, :parties

    def initialize(filename)
        @size = 0
        @parties = []
        File.open(filename,"r") do |f|
            @size = f.gets.to_i # number of parties
            1.upto(@size) do |party|
                guess_number = f.gets.to_i # number of guess
                slices_constraint = f.gets.split(" ").map!{|x|x.to_i} # constraint
                #puts "guess_number #{guess_number} slices_constraint #{slices_constraint.size}"
                raise "Input File Format Error" unless guess_number == slices_constraint.size
                @parties.push(slices_constraint)
            end
        end
    end

    def parties
        @parties
    end

end

class PizzaOptimizer    
    def minimum_pizzas(slices_constraint,number_slices_pizza=8.0)
        (slices_constraint.reduce(:+) / number_slices_pizza.to_f ).ceil
    end
end


reader = ReaderInput.new("challenge_001.input")
optimizer = PizzaOptimizer.new()
index = 1
reader.parties.each do |party| 
    puts "Case \##{index}: #{optimizer.minimum_pizzas(party)}"
    index += 1
end

