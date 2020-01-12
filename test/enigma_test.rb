require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_enigma_exists
    cipher = Enigma.new

    assert_instance_of Enigma, cipher
  end

  def test_enigma_encrypt_method_takes_arguments
    cipher = Enigma.new

    cipher.encrypt('hello', '04039', '110120')

    assert_equal 'hello', cipher.encrypt_group[:encryption]
    assert_equal '04039', cipher.encrypt_group[:key]
    assert_equal '110120', cipher.encrypt_group[:date]
  end
end
