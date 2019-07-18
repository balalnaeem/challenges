=begin
  PROBLEM:
  - so there are differnt lyrics if we have 0 bottle on hand, 1 bottle on hand or 2 bottles on hand
  - for the rest between 3 and 99 it's the same lyrics except for number adjustment on the second line.
=end
class BeerSong
  class VerseZero
    def verse(num)
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  class VerseOne
    def verse(num)
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end
  end

  class VerseTwo
    def verse(num)
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end
  end

  class RegularVerse
    def verse(num)
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    end
  end

  VERSE_CLASSES = Hash.new(RegularVerse).merge({
    0 => VerseZero,
    1 => VerseOne,
    2 => VerseTwo
  })

  def verse(number)
    VERSE_CLASSES[number].new.verse(number)
  end

  def verses(from, to)
    (to..from).to_a.reverse.map do |num|
      verse(num)
    end.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end