require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before :each do
    @cell = Cell.new('B4')
    @cruiser = Ship.new('Cruiser', 3)
  end

  describe 'instantiation' do
    it 'is a cell' do
      expect(@cell).to be_a(Cell)
    end

    it 'has attributes' do
      expect(@cell.coordinate).to eq('B4')
      expect(@cell.ship).to eq(nil)
    end
  end

  describe 'instance methods' do
    it 'returns bol if ship is empty?' do
      expect(@cell.empty?).to eq(true)
    end

    it 'can #place_ship' do
      @cell.place_ship(@cruiser)

      expect(@cell.ship).to eq(@cruiser)
      expect(@cell.empty?).to eq(false)
    end
  end
end
