require_relative 'cryptor'

class Encryptor < Cryptor
  def initialize(text, key = '', date = '')
    super(text, key, date)
  end
end
