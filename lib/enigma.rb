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
    encrypt_hash(encrypted, new_key, new_date)
  end

  def encrypt_hash(encrypted, new_key, new_date)
    {
      encryption: encrypted,
      key: new_key.digits,
      date: new_date.date
    }
  end

  def decrypt(encrypted_message, key = '', date = '')
    new_key = Key.new(key)
    new_date = Offset.new(date)
    downcase_message = encrypted_message.downcase
    shift = create_shift(new_key, new_date)
    decrypted = decrypt_message(downcase_message, shift)
    decrypt_hash(decrypted, new_key, new_date)
  end

  def decrypt_hash(decrypted, new_key, new_date)
    {
      decryption: decrypted,
      key: new_key.digits,
      date: new_date.date
    }
  end
end
