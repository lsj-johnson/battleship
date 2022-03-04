class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate, ship = nil)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    @ship.hit unless empty?
  end

  def render(show = false)
    if show && !empty? && !@fired_upon
      'S'
    elsif empty? && @fired_upon
      'M'
    elsif !empty? && @ship.sunk?
      'X'
    elsif !empty? && @fired_upon
      'H'
    else
      '.'
    end
  end
end
