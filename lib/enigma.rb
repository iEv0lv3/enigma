require 'date'
require './lib/modules/shift'
require './lib/modules/cipher'

class Enigma
  include Shift
  include Cipher

  def encrypt(message, key = '', date = '')
    new_key = Key.new(key)
    new_date = Offset.new(date)
    downcase_message = message.downcase
    shift = create_shift(new_key, new_date)
    encrypted = encrypt_message(downcase_message, shift)
    require 'pry'; binding.pry
    # The encrypt method returns a hash with three keys:
    # :encryption => the encrypted String
    # :key => the key used for encryption as a String
    # :date => the date used for encryption as a String in the form DDMMYY
  end

  def decrypt
    # (cipher_text, key, date)

    # The decrypt method returns a hash with three keys:

    # :decryption => the decrypted String
    # :key => the key used for decryption as a String
    # :date => the date used for decryption as a String in the form DDMMYY
  end
end
