=begin
  Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output.

  Treat invalid input as octal 0

  In: octal number (string)
  Out: decimal (integer)

  Al:
  - if from string input, any digit is greater than 7, return 0
  - best pseudocode is written with hand
=end

class Octal
  def initialize(octal_string)
    @octal_string = octal_string
    @digits = octal_string.chars.map(&:to_i)
  end

  def to_decimal
    return 0 if @octal_string.match?(/[^0-7]/)
    @digits.reverse.map.with_index do |num, idx|
      num * (8**idx)
    end.inject(:+)
  end
end

