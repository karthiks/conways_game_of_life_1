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
    end
  end 
  
end
