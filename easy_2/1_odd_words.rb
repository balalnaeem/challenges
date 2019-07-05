=begin
  Consider a character set consisting of letters, a space, and a point. Words consist of at most 20 letters. An input texts consists of one or more words separated from each other by one or more spaces and terminated by 0 or more spaces followed by a point. Input should be from, and including, the first letter of the first word, upto and including the termination point. The output text is to be produced such that successive words are separated by a single space with last word being termianted by a single point. Odd words are copied in reverse order while even words are merely echoed. For example the input string

  "whats the matter with kansas." becomes "whats eht matter htiw kansas."

  Bonus point: The character must be read and printed one at a time.

  PEDAC:
  PROBLEM:
    - we will given string consisting of letters, spaces and points.
    - Words consists of at most 20 letters.
    - words, separated by spaces, terminated by zero or more spaces followed by a point.
      "what the mattter with kansas ."
    - input is from the first letter till the ending point.
    - output should not have leading or trailing spaces. There should be '.' at the end of last word.
    - odd(indexed) words output in reversed order, even output the same
    - case sensitivity? true

  Al:
  - It looks I need words from the given character set
  - ignore the trailing spaces before the point, after the point, more than one space between words
  - use of String#scan can be handy
  - scan the words out
  - reverse the ones at odd index
  - join them with a space
  - add point at the end

  **Without Regex**
  -
=end

def reverse_odd_index_words(string)
  words_array = string.scan(/\b[a-z]+\b/i)
  words_array.map.with_index do |word, idx|
    if word.size <= 20
      idx.odd? ? word.reverse : word
    else
      word
    end
  end.join(' ').concat('.')
end




#Examples:

p reverse_odd_index_words("whats the matter with kansas.") == "whats eht matter htiw kansas."
p reverse_odd_index_words("whats  the matter with  kansas.") == "whats eht matter htiw kansas."
p reverse_odd_index_words("Whats the matter with Kansas.") == "Whats eht matter htiw Kansas."
p reverse_odd_index_words("whats the matter with kansas. ") == "whats eht matter htiw kansas."
p reverse_odd_index_words("whats the matter with kansas .") == "whats eht matter htiw kansas."
p reverse_odd_index_words("whats the matter with kansas bloodyhellmateyouokay.") == "whats eht matter htiw kansas bloodyhellmateyouokay."


