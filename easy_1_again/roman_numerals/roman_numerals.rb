=begin
  convert numbers to their equivalent roman numerals
  look up the roman numerals online

  in: integer
  out: roman numeral('string')

  al:
  - create a table to lookup roman equivlents for integers
  - Iterate over the lookup table and start from the top number
  - use divmod on each iteration, remainder will be set to a new number
  - quotient will be divided by appropriate roman numeral
  - return the result
=end

class Integer
  ROMAN_NUMERALS = {
    1000  =>  'M',
     900  =>  'CM',
     500  =>  'D',
     400  =>  'CD',
     100  =>  'C',
     90   =>  'XC',
     50   =>  'L',
     40   =>  'XL',
     10   =>  'X',
     9    =>  'IX',
     5    =>  'V',
     4    =>  'IV',
     3    =>  'III',
     2    =>  'II',
     1    =>  'I'
  }
  def to_roman
    remainder = self
    ROMAN_NUMERALS.each_with_object([]) do |(num, roman_letter), result|
      quotient, remainder = remainder.divmod(num)
      result << roman_letter * quotient
    end.join
  end
end

p 1999.to_roman