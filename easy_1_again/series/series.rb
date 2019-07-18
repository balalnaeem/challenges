=begin
  Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

  in: string, size of the series
  out: array of sub arrays(series) - with integers inside them

  al:
  - I could use #each_cons but that feels like cheating. So I would try and solve it with brute force.
  - convert the string of numbers into an array of integers
  - so if i have an array of lets say five numbers [1, 2, 3, 4, 5]
  - and I am required to produce a series of 3 numbers
    - [1, 2, 3]
    - [2, 3, 4]
    - [3, 4, 5] <<-- so I stop at 3, which is index 2 and 5-3 = 2
=end

class Series
  def initialize(string)
    @string = string
    @digits = string.chars.map(&:to_i)

  end

  def slices(limit)
    raise ArgumentError.new("Come on now!") if limit > @string.size
    result = []
    0.upto(@string.size - limit) do |idx|
      result << @digits[idx, limit]
    end
    result
  end
end