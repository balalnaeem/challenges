class Integer
  def to_roman
    roman_ones = %w(I II III IV V VI VII VIII IX)
    roman_tens = %w(X XX XXX XL L LX LXX LXXX XC)
    roman_hundreds = %w(C CC CC CD D DC DCC DCCC CM)

    # thousands = self / 1000
    # hundreds = self % 1000 / 100
    # tens = self % 1000 % 100 / 10
    # ones = self % 1000 % 100 % 10

    ones, tens, hundreds, thousands = self.digits

    roman_numeral = ''
    thousands.times { roman_numeral << 'M' } if thousands
    roman_numeral << roman_hundreds[hundreds - 1] if hundreds && hundreds > 0
    roman_numeral << roman_tens[tens - 1] if tens && tens > 0
    roman_numeral << roman_ones[ones - 1] if ones && ones > 0

    roman_numeral
  end
end

p 1000.to_roman