require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/modules/characters'

class CharactersTest < Minitest::Test
  include Characters

  def test_create_character_set
    set = create_character_set
    assert_equal 'a', set.first
    assert_eqaul ' ', set.last
  end
end
