require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test
  def test_key_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_key_length
    key = Key.new('04039')
    key2 = Key.new

    assert_equal 5, key.digits.size
    assert_equal 5, key2.digits.size
  end

  def test_make_keys_array_size_and_sub_arrays
    key1 = Key.new('04039')
    key2 = Key.new

    assert_equal 4, key1.make_keys(key1.digits).size
    assert_equal ['0', '4'], key1.make_keys(key1.digits).first
    assert_equal 4, key2.make_keys(key2.digits).size
  end
end
