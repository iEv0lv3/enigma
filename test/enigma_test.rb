require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
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

  def test_enigma_can_encrypt
    cipher = Enigma.new

    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }

    assert_equal expected, cipher.encrypt('hello world', '02715', '040895')
  end

  def test_enigma_can_decrypt
    cipher = Enigma.new

    expected = {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    }

    assert_equal expected, cipher.decrypt('keder ohulw', '02715', '040895')
  end
end
