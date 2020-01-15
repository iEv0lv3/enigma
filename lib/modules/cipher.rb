require './lib/modules/character'
require './lib/modules/shift'

module Cipher
  include Character
  include Shift

  def encrypt_message(message, shift)
    message_split = parse_message(message)
    indexes = message_alphabet_indexes(message_split)
    apply_shift(indexes, shift, 'encrypt')
  end

  def decrypt_message(message, shift)
    message_split = parse_message(message)
    indexes = message_alphabet_indexes(message_split)
    apply_shift(indexes, shift, 'decrypt')
  end

  def parse_message(message)
    message.split(//)
  end

  def message_alphabet_indexes(message_split)
    alphabet = create_character_hash
    indexes = message_split.map do |letter|
      if alphabet.include?(letter)
        alphabet[letter]
      else
        letter if !alphabet.include?(letter)
      end
    end
    indexes
  end
end
