=begin
  Write a program that will convert a trinary number, represented as a string (e.g. '102012'), to its decimal equivalent using first principles (without using an existing method or library that can work with numeral systems).

  - Trinary number contain only three digits 0, 1 and 2
  - invalid trinary numbers should should convert to decimal number 0

  in: a trinary number string
  out: decimal number

  al:
  - what I did for octal string. same thing. Only the base is 3
=end

class Trinary
  def initialize(trinary_string)
    @trinary_string = trinary_string
    @trinary_digits = trinary_string.chars.map(&:to_i).reverse
  end

  def to_decimal
    return 0 if @trinary_string.match? /[^0-2]/
    @trinary_digits.map.with_index { |num, idx| num * 3**idx }.sum
  end
end