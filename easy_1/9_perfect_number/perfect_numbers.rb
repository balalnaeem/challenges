=begin
Write a program that can tell if a number is perfect, abundant or deficient.

perfect number? equal to the sum of it's all positive divisors.
  For example: 6 is perfect number because 1+2+3 == 6
abundant number? where sum of it's all positive divisors is greater than the number itself
  For example: 12 is abundant number because 1+2+3+4+6 > 12
deficient number? where sum of it's all positive divisors is smaller than the number itself
  For example: 10 is a deficient number because 1+2+5 < 10 | Prime numbers are deficient as well

In: integer
Out: string

Rules:
  - raise error when the number is not positive
Al:
  - have a guard clause to raise an error
  - create a range from 1 till the number not inclusive
  - select all the numbers that perfectly divide into the given number
  - Find the sum of the all and compare with the given number
=end

class PerfectNumber
  def self.classify(number)
    raise RuntimeError.new("#{number} is a negative number.") if number < 0
    sum = (1...number).select { |e| number % e == 0 }.sum
    if sum == number
      'perfect'
    elsif sum > number
      'abundant'
    else
      'deficient'
    end
  end
end