require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cryptor'

class CryptorTest < Minitest::Test
  def test_cryptor_exists
    cryptor = Cryptor.new

    assert_instance_of Cryptor, cryptor
  end

  def test_cryptor_can_have_attributes
    cryptor = Cryptor.new

    assert_nil cryptor.message
    assert_nil cryptor.cipher_text
    assert_nil cryptor.key
    assert_nil cryptor.offset
    assert_nil cryptor.date
    assert_nil cryptor.enigma_shift
  end
end
