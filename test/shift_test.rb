require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/modules/shift'
require './lib/key'
require './lib/offset'

class ShiftTest < Minitest::Test
  include Shift

  def test_keys_and_offsets_are_created
    shift_key = Key.new
    shift_offset = Offset.new
    shift_test = create_shift(shift_key, shift_offset)

    assert_equal 4, keys.length
    assert_equal 4, offsets.length
  end
end
