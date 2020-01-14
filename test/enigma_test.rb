require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/modules/shift'
require './lib/modules/cipher'

class EnigmaTest < Minitest::Test
  def test_enigma_exists
    cipher = Enigma.new

    assert_instance_of Enigma, cipher
  end

  def test_enigma_encrypt_method_takes_arguments
    skip
    cipher = Enigma.new

    cipher.encrypt('hello', '04039', '110120')

    assert_equal 'hello', cipher.encrypt_group[:encryption]
    assert_equal '04039', cipher.encrypt_group[:key]
    assert_equal '110120', cipher.encrypt_group[:date]
  end

  def test_shift_can_be_created
    # create_shift
  end

  def test_message_can_be_encrypted
    enigma = Enigma.new

    enigma.encrypt('Wonderful little message!')
    require 'pry'; binding.pry
  end
end
