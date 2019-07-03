=begin
  Write a program that uses the Sieve of Eratosthenes to find all the primes from 2 up to a given number.

  => What is Sieve of Eratosthenes?
    It is basically a way of finding all the primes till a given number by rejecting all the mulitples of primes as we go along.
    And we stop doing the rejection while we are iterating through the range, if the current number* current number is greater than the given number limit
    For example if we have to find the all the primes till 30.
    And we start off by creating a range from 2 till 30.
    And start rejecting all the multiples of prime numbers e.g 2
    Buy the time we reach 7, we can stop. because 7x7 is bigger than 30. Now all the numbers left in the range are prime numbers

    in: integer(upper limit)
    out: array of prime number
    Al:
    - first create a range from 2 till the given integer, convert that to array
    - reject all the numbers that are divided by 2 evenly, and set the result equal to the array
    - now reject all the numbers that are divided by 3 evenly, and set the result equal to the array
    - now use the next number as divisor, and set the result equal to the array
    - so basically we are using the next number in the array each time
    - so we will need some sort of looping structure and a variable to keep track of index
    - And if at any point, current_number**2 > upper limit number, we break the loop. Because every number in the array now a prime number
    - and we return that array
=end

class Sieve
  def initialize(limit)
    @limit = limit
    @range = (2..@limit).to_a
  end

  def primes
    idx = 0
    while @range[idx]**2 <= @limit
      @range = @range.reject { |n| n != @range[idx] && n % @range[idx] == 0 }
      idx += 1
    end
    @range
  end
end