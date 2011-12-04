require 'spec_helper'

describe GameOfLife::Game do

  describe "initialization" do
    context "no input is given" do
      subject { GameOfLife::Game.new }

      it " # should initialize colony with a default size of 3 Rows and 3 columns, 0 lives and 0 generations-to-go" do
        #subject.colony.seed(lives, generations_to_go)
        #subject.colony.evolve.lives.should == []
        subject.colony.should == [[0,0,0],[0,0,0],[0,0,0]]
        subject.lives.should == []
        subject.generations_to_go.should == 0
      end
    end

    context "with input values" do
      let(:colony_size) { [4,4] }
      let(:lives) { [ [0,1], [1,1], [2,2] ] }
      let(:generations_to_go) { 1 }
      subject { GameOfLife::Game.new(colony_size, lives, generations_to_go) }

      it " # should initialize colony with input values" do
        subject.lives.should == lives
        subject.generations_to_go.should == generations_to_go
        subject.colony.should == [ [0,1,0,0], [0,1,0,0], [0,0,1,0], [0,0,0,0] ]
      end
    end
  end

  describe "evolution" do

      context "under-population" do
        let(:colony_size) { [3,3] }
        let(:generations_to_go) { 1 }

        it " # should have no survivors for the next generation, if a live cell has less than 2 live neighbours" do
          lives = [ [0,0], [0,1], [2,2] ]
          game = GameOfLife::Game.new(colony_size, lives, generations_to_go)
          game.colony.should == [[1,1,0], [0,0,0], [0,0,1]]
          game.evolve
          game.colony.should == [[0,0,0], [0,0,0], [0,0,0]]
        end
      end

      context "ideal-population" do
        let(:colony_size) { [3,3] }
        let(:generations_to_go) { 1 }

        it " # should carry the same survivor to next generation, if it is a live cell with 2 or 3 neighbours" do
          lives = [ [0,0], [0,1], [1,0] ]
          game = GameOfLife::Game.new(colony_size, lives, generations_to_go)
          game.colony.should == [[1,1,0], [1,0,0], [0,0,0]]
          game.evolve
          game.colony.should == [[1,1,0], [1,0,0], [0,0,0]]
        end
      end
  end
end
