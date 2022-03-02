require './lib/ship'

RSpec.describe Ship do
  before :each do
    @cruiser = Ship.new('Cruiser', 3)
  end

  it 'can create object' do
    expect(@cruiser).to be_a(Ship)
  end

  it 'has attributes' do
    expect(@cruiser.name).to eq('Cruiser')
    expect(@cruiser.length).to eq(3)
    expect(@cruiser.health).to eq(3)
  end

  it 'has sunk status' do
    expect(@cruiser.sunk?).to be false
  end

  it 'can take hits and be sunk' do
    @cruiser.hit

    expect(@cruiser.health).to eq(2)

    @cruiser.hit

    expect(@cruiser.sunk?).to be false
    expect(@cruiser.health).to eq(1)

    @cruiser.hit

    expect(@cruiser.sunk?).to be true
  end
end
