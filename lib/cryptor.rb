require 'date'
require_relative 'key'
require_relative 'offset'

class Cryptor
  attr_reader :message, :key, :offset

  def initialize(message, key = '', date = '')
    @message = message
    @key = Key.new(key)
    @offset = Offset.new(date)
  end
end
