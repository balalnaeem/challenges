=begin
  convert numbers to roman numerals.

  Trickier than it sounds. I will have a go now after the gym.

  Al:
  - I will first create a hash for all the roman values
=end

class Integer
  ROMAN_VALUES = {
    'M'  => 1000,
    'CM' => 900,
    'D'  => 500,
    'CD' => 400,
    'C'  => 100,
    'XC' => 90,
    'L'  => 50,
    'XL' => 40,
    'X'  => 10,
    'IX' => 9,
    'V'  => 5,
    'IV' => 4,
    'I'  => 1
  }
  def to_roman
    roman_numeral = ''
    number = self

    ROMAN_VALUES.each do |roman_letter, value|
      number_of_letters = number / value
      roman_numeral += roman_letter * number_of_letters
      number = number % value
    end

    roman_numeral
  end
end