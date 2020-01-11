require 'date'

class Enigma
  attr_reader :encrypt_group

  def initialize
    
  end

  def encrypt(message, key, date)
    # (message, key, date)

    # The encrypt method returns a hash with three keys:
    @encrypt_group[:encryption] = message
    @encrypt_group[:key] = key
    @encrypt_group[:date] = date
    # :encryption => the encrypted String
    # :key => the key used for encryption as a String
    # :date => the date used for encryption as a String in the form DDMMYY
    @encrypt_group = {
      :encryption => '',
      :key => '',
      :date => ''
    }
  end

  def decrypt
    # (cipher_text, key, date)

    # The decrypt method returns a hash with three keys:

    # :decryption => the decrypted String
    # :key => the key used for decryption as a String
    # :date => the date used for decryption as a String in the form DDMMYY
  end
end
