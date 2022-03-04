class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate, ship = nil)
    @coordinate = coordinate
    @ship = ship
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    fired_upon = false
    if not empty?
      fired_upon = @ship.health < @ship.length
    end
    fired_upon
  end

  def fire_upon
    if not empty?
      @ship.hit
    end
  end
end
