require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cryptor'
require './lib/encryptor'
require './lib/modules/shift'
require './lib/modules/cipher'

class EncryptorTest < Minitest::Test
  include Shift
  include Cipher

  def test_encryptor_exists
    encryptor = Encryptor.new('hello')

    assert_instance_of Encryptor, encryptor
  end

  def test_encryptor_can_have_attributes
    encryptor = Encryptor.new('hello')
    encryptor.stubs(:offset).returns('160782')
    encryptor.stubs(:key).returns('04039')

    assert_equal '160782', encryptor.offset
    assert_equal '04039', encryptor.key
  end

  def test_encryptor_build_crypt_helpers
    encryptor = Encryptor.new('hello')
    key = Key.new
    key.stubs(:digits).returns('04039')

    offset = Offset.new
    offset.stubs(:date).returns('160782')

    encryptor.stubs(:offset).returns(offset)
    encryptor.stubs(:key).returns(key)

    downcase_message = encryptor.message.downcase
    shift = create_shift(key, offset)
    secret = encrypt_message(downcase_message, shift)

    assert_equal 'mwqat', secret
  end
end
