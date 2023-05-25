class Triangle
  class TriangleError < StandardError
    def message
      "Invalid triangle"
    end
  end

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate_triangle

    if @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side1 == @side2 || @side2 == @side3 || @side1 == @side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    sides = [@side1, @side2, @side3]

    raise TriangleError, "Invalid triangle: all sides must be greater than 0" if sides.any? { |side| side <= 0 }
    raise TriangleError, "Invalid triangle: sides cannot be negative" if sides.any? { |side| side.negative? }
    raise TriangleError, "Invalid triangle: violates triangle inequality" unless triangle_inequality?

    true
  end

  def triangle_inequality?
    (@side1 + @side2 > @side3) && (@side1 + @side3 > @side2) && (@side2 + @side3 > @side1)
  end
end