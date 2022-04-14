class Board
  attr_reader :cells

  def initialize()
    @cells = {
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
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coord_array)
    return false if ship.length != coord_array.length

    return false if coord_array.any? { |coord| @cells[coord].ship != nil }

    valid = true
    index = 0

    while valid == true && index < coord_array.length - 1
      valid = (coord_array[index + 1].ord + coord_array[index + 1][1].ord) -
        (coord_array[index].ord + coord_array[index][1].ord) == 1
        index += 1
    end
    valid
  end

  def place(ship, coord_array)
    coord_array.each do |coord|
      @cells[coord].place_ship(ship)
    end
  end
end
