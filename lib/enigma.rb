require 'date'
require './lib/modules/shift'
require './lib/modules/cipher'
require_relative 'cryptor'
require_relative 'decryptor'
require_relative 'encryptor'
require_relative 'key'
require_relative 'offset'

class Enigma
  include Shift
  include Cipher

  def encrypt(message, key = '', date = '')
    encryptor = Encryptor.new(message, key, date)
    encryptor.build_crypt
    encrypt_hash(encryptor.secret, encryptor.key, encryptor.offset)
  end

  def encrypt_hash(encrypted, crypt_key, crypt_date)
    {
      encryption: encrypted,
      key: crypt_key.digits,
      date: crypt_date.date
    }
  end

  def decrypt(encrypted_message, key = '', date = '')
    decryptor = Decryptor.new(encrypted_message, key, date)
    decryptor.build_crypt
    decrypt_hash(decryptor.decrypted, decryptor.key, decryptor.offset)
  end

  def decrypt_hash(decrypted, crypt_key, crypt_date)
    {
      decryption: decrypted,
      key: crypt_key.digits,
      date: crypt_date.date
    }
  end

  def crack(message, date = '')
    key = '999999'
    until decrypt(message, key, date)[:decryption][-4..-1] == " end" || key == '000000'
      decrypt(message, key, date)[:key]
      num_key = key.to_i
      num_key -= 1 if num_key > 0
      key = '%05d' % num_key
    end
    decrypt(message, key, date)
  end
end
