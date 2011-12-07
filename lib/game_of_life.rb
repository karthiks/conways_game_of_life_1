module GameOfLife
 
  class Game
    ALIVE = 1
    DEAD = 0

    attr_reader :colony, :lives, :generations_to_go

    def initialize(colony_size=[3,3], life_seeds=[], number_of_generations=0)
      @colony_size = colony_size
      @colony = Array.new(colony_size[0]) { Array.new(colony_size[1],0) }
      @lives = life_seeds
      @generations_to_go = number_of_generations
      @current_generation = 0
      seed_colony
    end

    #plant lives in colony
    def seed_colony
      lives.each do |x,y|
        colony[y][x] = ALIVE
      end
    end

    def evolve
      new_colony = Array.new(@colony_size[0]) { Array.new(@colony_size[1],0) }
      puts "@colony -> #{@colony}"
      @colony.each_with_index do |row, y_pos|
        row.each_with_index do |element, x_pos|
          neighbours_count = count_neighbours(x_pos,y_pos)
          case neighbours_count
          when 0...2
            new_colony[y_pos][x_pos] = 0
          when 2
            new_colony[y_pos][x_pos] = @colony[y_pos][x_pos]
          when 3
            new_colony[y_pos][x_pos] = 1
          end #case
        end #row.each...
      end #colony.each...
      @colony = new_colony
      @current_generation += 1
    end #evolve()

    private

    def count_neighbours(row,col)
      neighbouring_positions = [ [row,col-1], 
                                 [row+1,col-1], [row+1,col], [row+1,col+1], 
                                 [row,col+1], 
                                 [row-1,col+1], [row-1,col], [row-1,col-1] ]
      neighbouring_positions = neighbouring_positions.select do |position| 
        (position.first >= 0 && position.first < @colony_size.first) && 
          (position.last >= 0 && position.last < @colony_size.last)
      end
      count = 0
      neighbouring_positions.each do |position|
        count += 1 if @colony[position.last][position.first] == 1
      end
      count
    end
  
  end

end
