require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cryptor'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  def test_encryptor_exists
    encryptor = Encryptor.new('hello')

    assert_instance_of Encryptor, encryptor
  end

  def test_encryptor_has_super_attributes
    encryptor = Encryptor.new('hello')

    assert_equal 'hello', encryptor.message
    assert_nil encryptor.cipher_text
    assert_equal '', encryptor.key
    assert_nil encryptor.offset
    assert_equal '', encryptor.date
    assert_nil encryptor.enigma_shift
  end
end
