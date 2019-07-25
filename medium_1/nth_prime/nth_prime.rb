=begin
  write a program that can tell you the nth prime number
  PROBLEM:
  - we need a class method #nth that will take an integer as an input
  - in order to hunt primes quicker, we can use certain shortcuts
  - But this problem is different we not need to check if a number is prime but to provide a certain number of primes
=end

class Prime
  def self.nth(num)
    raise ArgumentError.new if num < 1
    primes = []
    current_number = 2
    loop do
      primes << current_number if prime?(current_number)
      current_number += 1
      break if primes.size == num
    end
    primes.last
  end

  def self.prime?(number)
    (2..Math.sqrt(number)).each do |test|
      return false if number % test == 0
    end
    true
  end
end