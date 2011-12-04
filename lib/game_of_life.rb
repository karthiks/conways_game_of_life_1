module GameOfLife
 
  class Game
    ALIVE = 1
    DEAD = 0

    attr_reader :colony, :lives, :generations_to_go

    def initialize(colony_size=[3,3], life_seeds=[], number_of_generations=0)
      @colony = Array.new(colony_size[0]) { Array.new(colony_size[1],0) }
      @lives = life_seeds
      @generations_to_go = number_of_generations
      seed_colony
    end

    #plant lives in colony
    def seed_colony
      lives.each do |row,col|
        colony[row][col] = ALIVE
      end
    end

    def evolve
      new_colony = @colony.dup
      @colony.each_with_index do |row, index|
        row.each_with_index do |element, ind|
          neighbours_count = count_neighbours(ind,index)
          case neighbours_count
          when 0..2
            new_colony[ind][index] = 0
          end #case
          @colony = new_colony
        end #row.each...
      end #colony.each...
    end #evolve()

    private

    def count_neighbours(row,column)
      0
    end
  
  end

end
