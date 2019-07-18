=begin
  Write a program that given a phrase can count the occurrences of each word in that phrase.

  For example, if we count the words for the input "olly olly in come free", we should get:
    olly: 2
    in: 1
    come: 1
    free: 1
    Rules:
      - we are given a string of one or more words at initialization
      - we have to define an instance method word_count
      - output a hash structure with words as keys and their counts as values
      - ignore non-word characters like :*&^%$
      - ignore white space charcters like \n \t
      - string digits or numbers count as words
      - case insensitivity
      - apostrophes and quotations won't affect the word

    Al:
    - algorithm depends on splitting the string into an array and then iterating over it to count the occurences of words
    - we can use a regex expression to solit up the string
    - take the regex exp test by test
    - iterate over the array with each_with_object, where object is a {}
      - next if {} include word
      - hash[word] = arr.count(word)
=end

class Phrase
  attr_reader :words_array
  def initialize(sentence)
    @sentence = sentence
    @words_array = sentence.downcase.scan(/[a-z0-9]+[']?[a-z0-9]|[a-z0-9]+/i)
  end

  def word_count
    @words_array.each_with_object({}) do |word, hash|
      next if hash.include? word
      hash[word] = @words_array.count(word)
    end
  end
end

p Phrase.new("Joe can't tell between 'large' and large 9.").words_array

