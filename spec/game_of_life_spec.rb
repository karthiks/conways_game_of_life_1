require 'spec_helper'

class Game
  include GameOfLife
end

describe GameOfLife do
  subject { Game.new }

  it "should test ok" do
    subject.hi.should == "hi"
  end
end
