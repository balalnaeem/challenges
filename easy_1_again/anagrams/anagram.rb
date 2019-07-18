# USE PEDAC EVEN IF YOU KNOW THE PROBLEM BEFORE HAND

=begin
 write a program, that given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word.

 Given: a word, and a list(array) of words
 Out: an array of words

 Rules:
    - if there is no matching anagram, output empty array
    - program is case sensitive => if the word is 'corn' it won't match 'Corn' or 'Norc'
    - program won't select the words that are exact same. only the anagrams.
        if the word is 'corn', it won't select 'corn' from the given list
    - capitalized word meaning program would only select capitalized anagrams. case sensitivity matter.

  Al:
  - we have: a string(word), an array of strings(anagrams)
  - intialize a variable and set it equal to an empty array
  - This is goig to be a two step selection process
  - First we have to create a selection criteria based on case of the word provided
      e.g. if the word provided is capitalized, we select all the capitalized words from the list, if word provided is downcased, we select all the downcased words from the list, and same with upcased words
  - use of `send` method here once the case is decided to perform selection
  - once that is done, then selection of anagrams would be easy
  - once we have selected the right case words, we can downcase them, sort them and compare with our given word downcased and sorted
  - if they are equal, we select the anagrams. And uniq the array. Because above process might also select the same words

  PSEUDOCODE:
  @word is available from initialize
  def match(arr)
    word_case = IF @word.capitalize == @word
                  :capitalize
                ELSIF @word.upcase = @word
                  :upcase
                ELSE
                  :downcase
                END

    correct_case_words = arr.select { |word| word.send(word_case) == word }
    correct_case_words.select { |word| @word.downcase.chars.sort == word.downcase.chars.sort }
  end
=end

class Anagram
  def initialize(word)
    @word = word
    @sorted_chars = word.downcase.chars.sort
  end

  def match(arr)
    word_case = if @word.capitalize == @word
                  :capitalize
                elsif @word.upcase == @word
                  :upcase
                else
                  :downcase
                end
    arr.select { |word| word.send(word_case) ==  word }
      .select { |word| @word != word && @sorted_chars == word.downcase.chars.sort }
  end
end






















