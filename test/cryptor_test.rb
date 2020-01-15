require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/cryptor'

class CryptorTest < Minitest::Test
  def test_cryptor_exists
    cryptor = Cryptor.new('hello')

    assert_instance_of Cryptor, cryptor
  end

  def test_cryptor_can_have_attributes
    cryptor = Cryptor.new('hello')
    cryptor.stubs(:offset).returns('160782')
    cryptor.stubs(:key).returns('04039')

    assert_equal '160782', cryptor.offset
    assert_equal '04039', cryptor.key
  end
end
