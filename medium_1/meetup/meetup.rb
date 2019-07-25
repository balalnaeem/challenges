=begin
  PROBLEM:
  - class has a constructor method that takes a month and year
  - and an instance method `day` that takes a weekday and schedule
      - weekday is one of :monday, :tuesday, etc
      - schedule is :first, :second, :third, :fourth, :last or :teenth.
  - input is interms of symbols for the `day` method
  - And we are returning a date
  - teenth range from 13th to 19th(so 7 days)
  - Our job is to return the date that matches the day and the scedule

  Al:
  - if schedule is teenth
  - we can iterate over the dates from 13th to 19th
    and see on which date the day matches the day
  - that is our date
=end

require 'date'

class Meetup
  WEEK_DAYS = {
    sunday:    0,
    monday:    1,
    tuesday:   2,
    wednesday: 3,
    thursday:  4,
    friday:    5,
    saturday:  6
  }

  attr_reader :month, :year
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day, schedule)
    case schedule
    when :teenth then get_date(day, 13)
    when :first  then get_date(day, 1)
    when :second then get_date(day, 8)
    when :third  then get_date(day, 15)
    when :fourth then get_date(day, 22)
    else get_date(day, -7)
    end
  end

  def get_date(day, start_day)
    date = Date.new(year, month, start_day)
    7.times do
      return date if date.wday == WEEK_DAYS[day]
      date += 1
    end
  end
end
