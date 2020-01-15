require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/key'

class KeyTest < Minitest::Test
  def test_key_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_key_can_have_attributes
    key = Key.new('04039')
    key2 = Key.new
    key2.stubs(:digits).returns('34718')

    assert_equal '04039', key.digits
    assert_equal '34718', key2.digits
  end

  def test_make_keys_array
    key1 = Key.new('04039')
    key2 = Key.new
    key2.stubs(:digits).returns('34718')

    key_set1 = key1.make_keys(key1.digits)
    key_set2 = key2.make_keys(key2.digits)

    assert_equal [4, 4, 3, 12], key_set1
    assert_equal [7, 11, 8, 9], key_set2
  end

  def test_element_cons_can_be_created_and_added
    key1 = Key.new('04039')
    key2 = Key.new
    key2.stubs(:digits).returns('34718')

    elements1 = key1.digits.split(//)
    elements2 = key2.digits.split(//)

    expected1 = [["0", "4"], ["4", "0"], ["0", "3"], ["3", "9"]]
    expected2 = [["3", "4"], ["4", "7"], ["7", "1"], ["1", "8"]]

    assert_equal expected1, key1.element_cons(elements1)
    assert_equal expected2, key2.element_cons(elements2)

    key_set1 = key1.add_elements(expected1)
    key_set2 = key2.add_elements(expected2)

    assert_equal [4, 4, 3, 12], key_set1
    assert_equal [7, 11, 8, 9], key_set2
  end
end
