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

  def test_message_can_be_encrypted
    enigma = Enigma.new

    enigma.encrypt('Wonderful little message!')
    require 'pry'; binding.pry
  end
end
