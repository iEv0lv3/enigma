require './lib/modules/character'
require './lib/modules/shift'

module Cipher
  include Character
  include Shift

  def encrypt_message(message, shift)
    message_split = parse_message(message)
    shifts_needed = message_size(message_split)
    indexes = message_alphabet_indexes(message_split)
    cipher_text = apply_shift(indexes, shift)
    require 'pry'; binding.pry
  end

  def parse_message(message)
    message.split(//)
  end

  def message_size(message_split)
    [message_split.size / 4, message_split.size % 4]
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
