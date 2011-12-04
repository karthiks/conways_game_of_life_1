#File content source: https://github.com/coreyhaines/practice_game_of_life/blob/master/spec/spec_helper.rb

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__),'..','lib'))

require 'game_of_life'
#require 'spec'

RSpec.configure do |c|
  #c.fail_fast = true
end
