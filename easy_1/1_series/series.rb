=begin
Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

For example, the string "01234" has the following 3-digit series:
- 012
- 123
- 234
And the following 4-digit series:
- 0123
- 1234
#####################################################################

- I need a class named 'Series'
- need some sort of attribute for the objects of that class that will hold the input integer
- need to define a method named 'slice' that we can invoke on the objects of that class
- method 'slices' will take an integer as an argument, this integer has to be less than or equal to the length of the integer passed in as state of the object

- so for example:
  - if we have have a str_num '54321'
  - and we want all the possible series of length 4
  - we will get 5432, 4321
  - on each iteration we are getting a series of the length of 4
  - and on each iteration starting index is moving one step further until it's no more possible to make a series

  ==> until it's no more possible to make a series
  - Need to a way to figure that out. When is it not possible to make a series
  - so when the starting index reaches @max_length - series length, that is the last series

Al:
- so I can perform an iteration that starts from zero and finishes at max - series length.
- and on each iteration I can slice the series from the array like arr[idx, length]
=end

class Series
  def initialize(str_num)
    @num_arr = str_num.chars.map(&:to_i)
  end

  def slices(series_length)
    raise ArgumentError.new("You are asking for too much.") if series_length > @num_arr.size
    0.upto(@num_arr.size - series_length).map do |idx|
      @num_arr[idx, series_length]
    end
  end
end