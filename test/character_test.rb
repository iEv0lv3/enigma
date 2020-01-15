require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/modules/character'

class CharacterTest < Minitest::Test
  include Character

  def test_create_character_array_set
    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']

    assert_equal expected, create_character_array
  end

  def test_create_character_hash_set
    expected = { 'a' => 0,
                 'b' => 1,
                 'c' => 2,
                 'd' => 3,
                 'e' => 4,
                 'f' => 5,
                 'g' => 6,
                 'h' => 7,
                 'i' => 8,
                 'j' => 9,
                 'k' => 10,
                 'l' => 11,
                 'm' => 12,
                 'n' => 13,
                 'o' => 14,
                 'p' => 15,
                 'q' => 16,
                 'r' => 17,
                 's' => 18,
                 't' => 19,
                 'u' => 20,
                 'v' => 21,
                 'w' => 22,
                 'x' => 23,
                 'y' => 24,
                 'z' => 25,
                 ' ' => 26 }

    assert_equal expected, create_character_hash
  end
end
