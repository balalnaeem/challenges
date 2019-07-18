=begin
  abundant = sum of positive divisirs is greater than the number
  perfect = sum of positive divisors equals to the number
  deficit = sum of positive divisors is less than the number

  calculate the sum of positive divisors and then compare
=end

class PerfectNumber
  def self.classify(num)
    raise RuntimeError.new if num < 0

    sum_of_divisors = (1...num).select {|n| num % n == 0 }.sum
    return 'deficient' if sum_of_divisors < num
    return 'abundant' if sum_of_divisors > num
    'perfect'
  end
end