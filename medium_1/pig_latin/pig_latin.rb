=begin
  Rules:
    - if a word begins with a vowel sound, add an 'ay' to the end of the word
    - if a word begins with a consonant sound, move the sound to the end of the word and then add 'ay' sound
      consonant sound is all the letters that appear at the start of the word until a vowel does

  Edge Cases:
    - 'ch' is a consonant sound
    - 'qu' is a consonant sound
    - 'th' is a consonant sound
    - should work with multiple words as well
    - 'y' before a vowel is a consonant sound
    - 'y' before a consonant is a vowel sound
    - 'x' before a vowel is a consonant sound
    - 'x' before a consonant is vowel sound

    In: string
    out: string

    al:
    -
=end

class PigLatin
  def self.translate(word)
    new.translate(word)
  end

  def translate(string)
    @words = string.split
    @words.map { |word| replace_sounds(word) }.join(' ')
  end

  def replace_sounds(word)
    if word.match?(/^[aeiou]+/i) || word.match?(/^(x|y)[^aeiou]/i)
      vowels_tranformation(word)
    elsif word.match?(/^[^aeiou]+/i)
      consonants_transformation(word)
    end
  end

  def vowels_tranformation(word)
    word.concat('ay')
  end

  def consonants_transformation(word)
    consonant_sound = if word.match?(/^[^aeiouq]*qu/i)
                        word.scan(/^[^aeiouq]*qu/i)
                      elsif word.match?(/^[^aeiou]+/i)
                        word.scan(/^[^aeiouq]+/i)
                      end.join
    word.slice!(0, consonant_sound.size)
    word.concat(consonant_sound).concat('ay')
  end
end

p PigLatin.new.translate('yello')


