=begin

=end

class BeerSong
  def verse(bottles)
    @current_bottles = calculate_current_num(bottles)
    @bottles_left = calculate_next_num(bottles)

    @first_line = "#{@current_bottles} of beer on the wall, #{@current_bottles} of beer.\n"

    @line_2 = "Take one down and pass it around, #{@bottles_left} of beer on the wall.\n"

    @line_2_at_zero = "Go to the store and buy some more, #{@bottles_left} of beer on the wall.\n"
    @line_2_at_one = "Take it down and pass it around, #{@bottles_left} of beer on the wall.\n"

    @first_line.capitalize + select_line_2.capitalize
  end

  def select_line_2
    if @current_bottles == 'No more bottles'
      @line_2_at_zero
    elsif @current_bottles == '1 bottle'
      @line_2_at_one
    else
      @line_2
    end
  end

  def calculate_current_num(num_of_bottles)
    if num_of_bottles == 0
      'No more bottles'
    elsif num_of_bottles == 1
      '1 bottle'
    else
      "#{num_of_bottles} bottles"
    end
  end

  def calculate_next_num(num_of_bottles)
    num_of_bottles.zero? ? '99 bottles' : calculate_current_num(num_of_bottles - 1)
  end

  def verses(from, to)
    range = (to..from).to_a.reverse
    range.map { |bottles| verse(bottles) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

beersong = BeerSong.new

p beersong.verses(99, 98)

# expected = "99 bottles of beer on the wall, 99 bottles of beer.\n" \
#       "Take one down and pass it around, 98 bottles of beer on the wall.\n"