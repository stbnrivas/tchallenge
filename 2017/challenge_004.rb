# UNFINISHED EXERCISE
#
# info to test: https://es.wikipedia.org/wiki/Terna_pitag%C3%B3rica
# Pythagoras teorem is valid only for triangles rectangle h*h = a*a + b*b
# There are a General Theorem of Pythagoras but you need to split triangle not rectangle in two triangles rectangle and apply: 

# "El cuadrado del lado opuesto a un ángulo agudo es igual a la suma de los cuadrados de loso otros dos lados menos el doble producto de uno de ellos por la proyección del otro sobre él"
# ""El cuadrado del lado opuesto a un ángulo agudo es igual a la suma de los cuadrados de loso otros dos lados menos el doble producto de uno de ellos por la proyección del otro sobre él""

# QUESTION  13, 13, 1
#   13*13 == 13*13 + 1*1 # triangle rectangle?


class InputReader
    attr_reader :inputs
    def initialize(filename)
        @inputs = []
        File.open(filename,"r") do |f|
            cases = f.gets.to_i
            1.upto(cases) do
                new_input = f.gets.split(" ").map!{|x|x.to_i}
                # puts "new_input.size=#{new_input.drop(1).size} new_input[0]=#{new_input[0]}"
                raise "File Input Error Exception" unless new_input.drop(1).size == new_input[0]
                @inputs.push(new_input.drop(1))
            end
        end
    end
end 

class SearcherTrianglesWithSides
    attr_reader :sides, :triangles
    def initialize(input)
        @sides = input.sort.reverse # ñapa ;(
        @triangles = Array.new
        nil
    end

    def search_triangles
        @triangles = Array.new  
        sides = @sides
        sides.each do |h|
            first_sides = sides.drop(1)
            first_sides.each do |a|
                second_side = first_sides.drop(1)
                second_side.each do |b|
                    #puts "h=#{h} a=#{a} b=#{b} | #{is_triangle?(h,a,b)}"
                    @triangles.push([h,a,b]) if is_triangle?(h,a,b) and not is_duplicated(h,a,b)
                end
            end
        end
        #@triangles.uniq
    end

    def is_duplicated(h,a,b)
        @triangles.include?([h,a,b]) or @triangles.include?([h,b,a])
    end

    def is_triangle?(h,a,b)
        #puts "is triangle rectangle a=#{a} b=#{b} h=#{h}" if (a*a+b*b)==h*h        
        (a**2+b**2)==h**2
    end

    def perimeter_of_smaller_triangle
        result = nil
        @triangles.each do |t|
            new_perimeter = t.reduce(:+)            
            result = new_perimeter if result.nil? or result > new_perimeter
        end
        result
    end

end



reader = InputReader.new("challenge_004.input")
inputs = reader.inputs
# puts inputs.inspect

searcher1 = SearcherTrianglesWithSides.new(inputs[0])
searcher1.search_triangles
min_perimeter = searcher1.perimeter_of_smaller_triangle || "IMPOSIBLE"
puts "Case \#1: #{min_perimeter}"

searcher2 = SearcherTrianglesWithSides.new(inputs[1])
triangles2 = searcher2.search_triangles
min_perimeter = searcher2.perimeter_of_smaller_triangle || "IMPOSIBLE"
puts "Case \#2: #{min_perimeter}"

searcher3 = SearcherTrianglesWithSides.new(inputs[2])
triangles3 = searcher2.search_triangles
min_perimeter = searcher2.perimeter_of_smaller_triangle || "IMPOSIBLE"
puts "Case \#3: #{min_perimeter}"

searcher3 = SearcherTrianglesWithSides.new(inputs[3])
triangles3 = searcher3.search_triangles
min_perimeter = searcher3.perimeter_of_smaller_triangle || "IMPOSIBLE"
puts "Case \#4: #{min_perimeter}"

searcher4 = SearcherTrianglesWithSides.new(inputs[4])
triangles4 = searcher4.search_triangles
min_perimeter = searcher4.perimeter_of_smaller_triangle || "IMPOSIBLE"
#puts " #{searcher5.triangles.inspect}"
puts "Case \#5: #{min_perimeter}"
