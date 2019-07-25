=begin
  ##### circular buffer #####

=end

class CircularBuffer
  attr_reader :length
  attr_accessor :buffer

  def initialize(length)
   @buffer = Array.new
   @length = length
  end

  def read
    raise BufferEmptyException.new if buffer.empty?
    buffer.shift
  end

  def write(ele)
    raise BufferFullException.new if buffer.size == length
    buffer << ele unless ele.nil?
  end

  def write!(ele)
    return if ele.nil?
    read if buffer.size == length
    write(ele)
  end

  def clear
    self.buffer = Array.new
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end


