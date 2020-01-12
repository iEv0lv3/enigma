require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cryptor'

class CryptorTest < Minitest::Test
  def test_cryptor_exists
    cryptor = Cryptor.new('hello')

    assert_instance_of Cryptor, cryptor
  end

  def test_cryptor_can_have_attributes
    cryptor = Cryptor.new('hello')

    assert_equal 'hello', cryptor.message
    assert_nil cryptor.cipher_text
    assert_equal '', cryptor.key
    assert_nil cryptor.offset
    assert_equal '', cryptor.date
    assert_nil cryptor.enigma_shift
  end
end
