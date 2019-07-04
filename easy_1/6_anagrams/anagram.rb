=begin
  Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word.

  Rules:
  - case insensitive
  - although the output will shown in the correct form
  - don't select the same words for example corn shouldn't select Corn or corn.

  given: a word, possible anagrams (strings)
  expected: list(array) of correct anagrams

  Al:
  - first of all convert the word into array of chars and sort it(word.downcase.chars.sort)
  - then iterate over the list and perform selection
    - next every time the word in the list is same as the given word, because we don't want to select that word
    - we want to select anagrams
    - select the word from the list if word.downcase.chars.sort == chars
    - return that array
=end

class Anagram
  def initialize(word)
    @chars = word.downcase.chars
  end

  def match(list)
    list.select do |word_in_list|
      next if @chars == word_in_list.downcase.chars
      @chars.sort == word_in_list.downcase.chars.sort
    end
  end
end