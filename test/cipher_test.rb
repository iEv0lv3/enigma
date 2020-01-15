require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/modules/cipher'

class CipherTest < Minitest::Test
  include Cipher

  def test_cipher_parse_message
    message = 'wonderful little message!'

    expected = ["w", "o", "n", "d", "e", "r", "f", "u", "l", " ", "l", "i", "t", "t", "l", "e", " ", "m", "e", "s", "s", "a", "g", "e", "!"]

    assert_equal expected, parse_message(message)
  end

  def test_cipher_message_alphabet_indexes_can_be_created
    message = 'wonderful little message!'
    message_split = parse_message(message)

    expected = [22, 14, 13, 3, 4, 17, 5, 20, 11, 26, 11, 8, 19, 19, 11, 4, 26, 12, 4, 18, 18, 0, 6, 4, "!"]

    assert_equal expected, message_alphabet_indexes(message_split)
  end

  def test_encrypt_message
    # encrypt_message integration test
  end
end
