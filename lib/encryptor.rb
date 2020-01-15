require_relative 'cryptor'
require 'date'
require './lib/modules/shift'
require './lib/modules/cipher'
require_relative 'key'
require_relative 'offset'

class Encryptor < Cryptor
  attr_reader :secret

  include Shift
  include Cipher

  def initialize(message, key = '', date = '')
    @secret = ''
    super(message, key, date)
  end

  def build_crypt
    downcase_message = @message.downcase
    shift = create_shift(@key, @offset)
    @secret = encrypt_message(downcase_message, shift)
  end
end
