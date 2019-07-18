=begin
  Write a program that can calculate the Hamming distance between two DNA strands.

  The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.

  Rules:
  - no difference between empty strings
  - no difference between identical strings
  - do not actually mutate original string

  given: 2 strands(strings)
  out: integer

  al:
  - we have two strands: original strand, given strand
  - We have to iterate over the smaller of both
  - with simultaneous assignment operator
  - Array#select.Array#size
  - select the same at the same index
=end

class DNA
  def initialize(strand)
    @original_strand = strand
  end

  def hamming_distance(other_strand)
    shorter, longer = [@original_strand, other_strand].sort_by(&:size)
    shorter.chars.select.with_index { |str, i| str != longer[i] }.size
  end
end