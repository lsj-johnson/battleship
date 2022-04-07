require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  before :each do
    @board = Board.new
  end

  it 'instantiation' do
    expect(@board).to be_a(Board)
    expect(@board.cells).to be_a(Hash)
    expect(@board.cells.length).to eq(16)
    expect(@board.cells['A1']).to be_a(Cell)
    expect(@board.cells['C3']).to be_a(Cell)
    expect(@board.cells['D4']).to be_a(Cell)
    expect(@board.cells['D4'].coordinate).to eq('D4')
  end

  it 'can #valid_coordinate?' do
    expect(@board.valid_coordinate?('A1')).to be true
    expect(@board.valid_coordinate?('D4')).to be true
    expect(@board.valid_coordinate?('A5')).to be false
    expect(@board.valid_coordinate?('E1')).to be false
    expect(@board.valid_coordinate?('A22')).to be false
  end

  describe '#valid_placement?' do
    context 'Ship placement is valid' do

      before  :each do
        @cruiser = Ship.new('Cruiser', 3)
        @submarine = Ship.new('Submarine', 2)
      end

      it 'check proper ship length' do
        expect(@board.valid_placement?(@cruiser, ['A1', 'A2'])).to be false
        expect(@board.valid_placement?(@submarine, ['A2', 'A3', 'A4'])).to be false
      end

      it 'coordinates are consecutive' do
        expect(@board.valid_placement?(@cruiser, ['A1', 'A2', 'A4'])).to be false
        expect(@board.valid_placement?(@submarine, ['A1', 'C1'])).to be false
        expect(@board.valid_placement?(@cruiser, ['A3', 'A2', 'A1'])).to be false
        expect(@board.valid_placement?(@submarine, ['C1', 'B1'])).to be false
      end

      it 'coordinates are not diagonal' do
        expect(@board.valid_placement?(@cruiser, ['A1', 'B2', 'C3'])).to be false
        expect(@board.valid_placement?(@submarine, ['C2', 'D3'])).to be false
      end

      it 'can #valid_placement?' do
        expect(@board.valid_placement?(@submarine, ['A1', 'A2'])).to be true
        expect(@board.valid_placement?(@cruiser, ['B1', 'C1', 'D1'])).to be true
      end
    end
  end
end
