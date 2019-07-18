=begin
  PROBLEM:
  - we are given a table of letters and their score
  - we have to calculate scrabble score for words that are given to us based on that table

  RULES:
  - empty strings have a 0 scrabble score
  - white space characters have a 0 score
  - nil has a 0 characters score

  al:
  - we can create hash look up table for scores
=end

class Scrabble
  SCORE_TABLE = {
    %w(A E I O U L N R S T) => 1,
    %w(D G)                 => 2,
    %w(B C M P)             => 3,
    %w(F H V W Y)           => 4,
    %w(K)                   => 5,
    %w(J X)                 => 8,
    %w(Q Z)                 => 10
  }

  def initialize(word)
    @word = word
  end

  def self.score(word)
    self.new(word).score
  end

  def score
    return 0 if @word.nil?
    score = 0
    @word.chars.each do |char|
      SCORE_TABLE.each { |arr, val| score += val if arr.include? char.upcase }
    end
    score
  end
end