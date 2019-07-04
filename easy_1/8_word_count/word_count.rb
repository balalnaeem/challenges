=begin
  Write a program that given a phrase can count the occurrences of each word in that phrase.

  For example, if we count the words for the input "olly olly in come free", we should get:
  olly: 2
  in: 1
  come: 1
  free: 1

  In: String of words
  Out: a count the occurence of each word( so may be a hash structure )

  Rules:
    - case insensitive approach
    - anything that's not letters is not considered word (:, !, &, \n)
    - words in quotes are the same as the words withtout them e.g. 'large' same as large

  Al:
    - split the string at non_word characters \W
    - create a hash with 0 as default value
    - iterate over the split string, and each time += 1 the words value
=end

class Phrase
  def initialize(string)
    @words = string.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    counts = Hash.new(0)
    @words.each do |word|
      counts[word] += 1
    end
    counts
  end
end