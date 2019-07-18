=begin
  - use Sieve of Eratosthenes to find all the prime numbers from 2 till a given number
  - we iteratively mark the multiples of each prime as not prime
  - create your range starting from 2 till the given limit

    - take the next unmarked number in your range (it is prime)
    - mark all the multiples of that number as not prime

  al:
  - create a range from 2 till the given number, convert it to an array
  - intialize a variable `primes` and set it equal to range
  - initialize a variable idx and set it equal to 0
  - start some sort of looping structure
  - intialize a variable `current_prime` and set it equal to the number at the idx
  - invoke reject on primes, rejecting all those numbers that are multiples of current prime
  - save the result back into primes
  - increase the idx var by 1
  - break if current_prime x current_prime > limit
=end

class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    primes = (2..@limit).to_a
    idx = 0
    loop do
      primes = primes.reject { |num| num != primes[idx] && num % primes[idx] == 0 }
      idx += 1
      break if primes[idx]**2 > @limit
    end
    primes
  end
end
