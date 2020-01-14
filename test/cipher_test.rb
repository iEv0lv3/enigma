require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/modules/cipher'

class CipherTest < Minitest::Test
  def test_cipher
    require 'pry'; binding.pry
  end
end
