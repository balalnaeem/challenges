class SumOfMultiples
  def initialize(*nums)
    @nums = nums.empty? ? [3, 5] : nums
  end

  def self.to(limit)
    new.to(limit)
  end

  def to(limit)
    range = (@nums.first...limit).to_a
    multiples = []
    @nums.each do |n|
      multiples += range.select { |number| number % n == 0 }
    end
    multiples.uniq.sum
  end
end

p SumOfMultiples.new(4, 6).to(15)