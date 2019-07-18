=begin
  problem:
  - we are given a sentence that includes letters, spaces, and points.
  - words consist of one or more letters, at most 20 letters.
  - in the input string, words could be joined one or more spaces, last word may be followed by a space, and then surely is followed by a point.

  requirements for output:
  - words are separated by a single space, with the last word being terminated by a single point.
  - odd words are ouput in reverse order

  "whats the matter with kansas." => "whats eht matter htiw kansas."

  al:
  - I could use regex to scan the string and get the words out
  - then join the array and add a point at the end
=end

## Bonus version

def reverse_odd_words(sentence)
  sentence.chars.map.with_index do |char, idx|
    next if char == ' ' && sentence.chars[idx+1] == ' ' || char == '.'
    char
  end.compact.join.split
  .map.with_index { |word, idx| idx.odd? ? word.reverse : word }.join(' ').concat('.')
end

#examples

p reverse_odd_words("whats the matter with kansas.") == "whats eht matter htiw kansas."
p reverse_odd_words("whats  the  matter  with  kansas.") == "whats eht matter htiw kansas."
p reverse_odd_words("whats the matter with kansas .") == "whats eht matter htiw kansas."
p reverse_odd_words('a  b    c   d e  .') == 'a b c d e.'

