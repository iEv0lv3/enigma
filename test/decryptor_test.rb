require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cryptor'
require './lib/decryptor'
require './lib/modules/shift'
require './lib/modules/cipher'

class DecryptorTest < Minitest::Test
  include Shift
  include Cipher

  def test_decryptor_exists
    decryptor = Decryptor.new('hello')

    assert_instance_of Decryptor, decryptor
  end

  def test_decryptor_can_have_attributes
    decryptor = Decryptor.new('hello')
    decryptor.stubs(:offset).returns('160782')
    decryptor.stubs(:key).returns('04039')

    assert_equal '160782', decryptor.offset
    assert_equal '04039', decryptor.key
  end

  def test_decryptor_build_crypt_helpers
    decryptor = Decryptor.new('mwqat')
    key = Key.new
    key.stubs(:digits).returns('04039')

    offset = Offset.new
    offset.stubs(:date).returns('160782')

    decryptor.stubs(:offset).returns(offset)
    decryptor.stubs(:key).returns(key)

    downcase_message = decryptor.message.downcase
    shift = create_shift(key, offset)
    decrypted = decrypt_message(downcase_message, shift)

    assert_equal 'hello', decrypted
  end
end
