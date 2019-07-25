=begin
  Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages.

  RULES:
  - If the phone number is less than 10 digits assume that it is bad number
  - If the phone number is 10 digits assume that it is good
  - If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
  - If the phone number is 11 digits and the first number is not 1, then it is a bad number
  - If the phone number is more than 11 digits assume that it is a bad number
  - For bad number we return a string of zeros '0000000000'

  PROBLEM:
  - We need an instance method `number`
    - cleans up the given string
    - and if it is a valid number, returns the clean number string
    - if not then return the string of zeros
  - We need an instance method `area_codethat`
    - that checks if the number is valid
    - and then returns the first 3 digits of the valid number
  - We need an instance method #to_s
    - that will return the number in valid form
    - of course the number has to be valid even though there are no tests for it

  AL:
  - #number
    - clean the given string - invoke String#gsub
    - if there are 10 numbers, return that number - String#size
    - if there are 11 numbers and the first number is 1, slice the last 10 numbers - String#slice
    - if size is less than 10, or more than 11, it's a bad number
=end

class PhoneNumber
  attr_reader :str_num

  def initialize(str_num)
    @str_num = str_num
  end

  def number
    digits = str_num.gsub(/[^0-9]/, '')
    return '0000000000' if str_num.match?(/[a-z]/)
    return digits if digits.size == 10
    return digits[1..-1] if digits.size == 11 && digits[0] == '1'
    '0000000000'
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end
end






















