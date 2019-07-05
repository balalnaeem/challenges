=begin
Write a program that, given a word, computes the scrabble score for that word.

Rules
 - no score for white spaces, empty strings, and nil == 0
 - input string can be either downcase or uppercase
 - there's no test cases where numbers are given, so we can ignore dealing with numbers
 - there is a score table available

In: string
Out: integer
Al:
- have a guard clause to make sure empty strings, nil or white spaces return 0
- initialize a constant for letter values table
- convert the string into an array of characters, or just iterate over it with each_char
- at each iteration check the letter in the word matches what set of characters in the hash table, add the correspoding  value to a score variable.
- return the variable at the end

- I could use reduce for that purposes
=end

class Scrabble
  LETTER_VALUES = {
    ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
    ['D', 'G']                                         => 2,
    ['B', 'C', 'M', 'P']                               => 3,
    ['F', 'H', 'V', 'W', 'Y']                          => 4,
    ['K']                                              => 5,
    ['J', 'X']                                         => 8,
    ['Q', 'Z']                                         => 10
  }
  def initialize(string)
    @string = string
  end

  def self.score(string)
    new(string).score
  end

  def score
    return 0 if @string.nil?
    score = 0
    @string.upcase.each_char do |letter|
      LETTER_VALUES.each do |array, value|
        score += value if array.include?(letter)
      end
    end
    score
  end
end