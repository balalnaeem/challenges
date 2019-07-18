class Trinary
  def initialize(tri_str)
    @tri_str = tri_str
    @digits = tri_str.chars.map(&:to_i)
  end

  def to_decimal
    return 0 if @tri_str.match? (/[^0-2]/)
    @digits.reverse.map.with_index { |n, i| n * 3**i }.inject(:+)
  end
end