=begin
  Write a program that can calculate the Hamming distance between two DNA strands.

  Input: at 2 points
    - when initializing an object of the class DNA 'string of capital letters'
    - when invoking the method DNA#hamming_distance 'string of capital letters'
  Out: integer
  Al:
  - count the number of times, the characters in the smaller string are different from the character in the longer string at the same index, that hamming distance
  - Mostly two string will be of same length
  - But if two different length strings are provided, we iterate over the samaller one
  - I can use each_with_index
    - use count inside the iteration, that should do that job

  -
=end

class DNA
  def initialize(strand1)
    @strand1 = strand1
  end

  def hamming_distance(strand2)
    main_strand = @strand1
    second_strand = strand2
    if strand2.size < @strand1.size
      main_strand, second_strand = strand2, @strand1
    end
    main_strand.chars.select.with_index do |base, idx|
      base != second_strand[idx]
    end.count
  end
end