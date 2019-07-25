=begin
  write a program that given a number:
  - Can check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid.

  in: a number
  out: boolean

  rules: luhn formula rules
            - start from right most digit (5437) from in this example and 'luhn double' every second number(so every odd indexed number from back)
            - if I call Integer#digits on that it would return 7345, 'luhn double' every odd indexed digit
            - then add them all up and see if the number ends in 0
  what is luhn double?
    - if by doubling the number, we get a number tha is bigger than 10, we subtract 9 from it

  al:
    - define a method called luhn_double that takes a digit and double it accordign to luhn formula.
      - multiply the digit by 2.
      - if the result is bigger than 10
      - subtract 9 and return, else just return the result
=end

class Luhn
  def initialize(num)
    @num = num
  end

  def self.create(num)
    checksum = num.digits.map.with_index do |n, idx|
      idx.even? ? new(n).luhn_double(n) : n
    end.sum
    add_num = (10 - (checksum % 10)) % 10
    (num.to_s + add_num.to_s).to_i
  end

  def valid?
    checksum % 10 == 0
  end

  def checksum
    addends.sum
  end

  def addends
    @num.digits.map.with_index {|n, idx| idx.odd? ? luhn_double(n) : n }.reverse
  end

  def luhn_double(n)
    double = n * 2
    double >= 10 ? double - 9 : double
  end
end

p Luhn.create(123)








