=begin
  create a clock that is independent of time.
  RULES:
  - we should be able to add and subtract minutes to the clock
  - two clocks that represent the same time should be equal to each other

  PROBLEM:
  - we have to define a class method #at that takes one or two arguments integers
  - these integers have to be translated into time in 24 hour format in string form
  - #at shoudl return an instance of the class that is translated in time with to_s
  - the same instance should also accept minutes with + method
  Breaking down the time conversion to minutes int 24 hour format.
    - hours need to molulused by 24
      24 x 60 = 1440
      1440 / 60 = 24

      10 x 60 = 600
      600 - 90 = 510
      510.divmod(60) = [8, 30]
  so we can have hours converted into minutes
  and have for to_s method as well + method to
=end

require 'pry'

class Clock
  def self.at(hours, minutes = 0)
    new(hours, minutes)
  end

  def +(xtra_minutes)
    total_minutes = (hours * 60) + minutes + xtra_minutes
    new_hours, new_minutes = total_minutes.divmod(60)
    new_hours = new_hours % 24
    self.class.new(new_hours, new_minutes)
  end

  def -(xtra_minutes)
    total_minutes = (hours * 60) + minutes - xtra_minutes
    new_hours, new_minutes = total_minutes.divmod(60)
    binding.pry
    new_hours = new_hours % 24
    self.class.new(new_hours, new_minutes)
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end

  def to_s
    first_part = "%02d" % [hours]
    second_part = "%02d" % [minutes]
    "#{first_part}:#{second_part}"
  end

  protected

  attr_accessor :hours, :minutes

  def initialize(hours, minutes = 0)
    @hours = hours
    @minutes = minutes
  end
end


clock = Clock.at(0, 30) - 60
p clock.to_s




