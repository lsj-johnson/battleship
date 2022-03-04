class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate, ship = nil)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if not empty?
      @ship.hit
    end
  end

  def render(show=false)
    render = '.'
    if show and not empty? and not @fired_upon
      render = 'S'
    elsif empty? and @fired_upon
      render = 'M'
    elsif not empty? and @ship.sunk?
      render = 'X'
    elsif not empty? and @fired_upon
      render = 'H'
    end
    render
  end
end
