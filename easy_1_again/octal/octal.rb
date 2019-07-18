=begin
  Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output.

  - treat invalid input as octal 0
  - brute force, no help from any methods
  155
  so I can use divmod, and take the last element and prepend that into a string after converting it
  and return that string in the end, after converting it to integer

  - divmod_return = []
  - divmod.last.to_s
=end

require 'pry'

class Octal
  def initialize(string)
    @octal_string = string
    @digits = @octal_string.chars.map(&:to_i)
  end

  def to_decimal
    return 0 if @octal_string.match? (/[^0-7]/)
    @digits.reverse.map.with_index { |n, i| n*(8**i) }.inject(:+)
  end
end