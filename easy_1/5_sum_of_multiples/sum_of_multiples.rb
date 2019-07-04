=begin
  Write a program that, given a number, can find the sum of all the multiples of 'particular numbers'?? up to but not including that number.

  If we list all the natural numbers up to but not including 20
  that are multiples of either 3 or 5
  we get 3, 5, 6, 9, 10, 12, 15, and 18
  The sum of these multiples is 78

  That's the logic.

  Write a program that can find the sum of the multiples of a given set of numbers. If no set of numbers is given, default to 3 and 5.

  Questions:
    - Does the set always is more than one numbers?
    - a class method and an instance method?
  In: at two points
        1) when invoking the methods (given number limit)
        2) when initializing a new object of the class (sets of particular numbers) optional. default = [3, 5]
  Out: Integer

  Al:
  - so that method is named #to in the tests
  - It is being invoked on the class itself as well as on objects
    - when it is being invoke on the class we don't have to worry about the set of particular numbers, because then it's just [3, 5]
    - when it is being invoked on instance of the class, then we have to see if we are provided with the set of particular numbers, if not then it's [3, 5]
    - There is no test scenario like that, so I will write my own test.

  - we can use Integer#step and create ranges starting fom each number from the given set
  - there is a little problem with #step, it includes the final number. So I better go with range

  - I can create a range from smalles given particular number to the limit not inclusive
  - and iterate over the particular numbers calculating all the multiples from the range and selecting them in an array
  - return the sum of the uniq array at the end
=end

class SumOfMultiples
  attr_reader :numbers

  def initialize(*set)
    @numbers = set.empty? ? [3, 5] : set
  end

  def self.to(limit)
    new.to(limit)
  end

  def to(limit)
    multiples = []
    range = (numbers.min...limit).to_a
    range.select do |num|
      numbers.any? { |divisor| num % divisor == 0 }
    end.sum
  end
end


























