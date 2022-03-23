require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  it 'instatiation' do
    @board = Board.new
    @board_cells = {
      'A1' => Cell.new('A1'),
      'A2' => Cell.new('A2'),
      'A3' => Cell.new('A3'),
      'A4' => Cell.new('A4'),
      'B1' => Cell.new('B1'),
      'B2' => Cell.new('B2'),
      'B3' => Cell.new('B3'),
      'B4' => Cell.new('B4'),
      'C1' => Cell.new('C1'),
      'C2' => Cell.new('C2'),
      'C3' => Cell.new('C3'),
      'C4' => Cell.new('C4'),
      'D1' => Cell.new('D1'),
      'D2' => Cell.new('D2'),
      'D3' => Cell.new('D3'),
      'D4' => Cell.new('D4'),
    }


    expect(@board).to be_a(Board)
    expect(@board.cells).to be_a(Hash)
    expect(@board.cells.length).to eq(16)
    expect(@board.cells['A1']).to be_a(Cell)
    expect(@board.cells['C3']).to be_a(Cell)
    expect(@board.cells['D4']).to be_a(Cell)
  end
end
