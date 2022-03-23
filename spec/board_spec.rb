require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  it 'instatiation' do
    @board = Board.new

    expect(@board).to be_a(Board)
  end 
end
