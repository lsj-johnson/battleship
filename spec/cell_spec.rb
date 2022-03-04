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

    it 'can return bol if #fired_upon' do
      @cell.place_ship(@cruiser)

      expect(@cell.fired_upon?).to be false

      @cell.fire_upon

      expect(@cell.ship.health).to eq(2)
      expect(@cell.fired_upon?).to be true
    end

    it 'can #render when cell empty' do
      expect(@cell.render).to eq('.')

      @cell.fire_upon

      expect(@cell.render).to eq('M')
    end

    before  :each do
      @cell_2 = Cell.new('C3')
      @cell_2.place_ship(@cruiser)
    end

    it 'can #render when show is true' do
      expect(@cell_2.render).to eq('.')
      expect(@cell_2.render(true)).to eq('S')
    end

    it 'can #render when cell is not empty' do
      @cell_2.fire_upon

      expect(@cell_2.render).to eq('H')
      expect(@cruiser.sunk?).to be false

      @cruiser.hit
      @cruiser.hit

      expect(@cruiser.sunk?).to be true
      expect(@cell_2.render).to eq('X')
    end
  end
end
