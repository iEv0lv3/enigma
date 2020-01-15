require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/modules/shift'
require './lib/modules/cipher'
require './lib/key'
require './lib/offset'

class ShiftTest < Minitest::Test
  include Shift
  include Cipher

  def test_keys_and_offsets_are_created
    skip
    shift_key = Key.new
    shift_offset = Offset.new
    shift_test = create_shift(shift_key, shift_offset)

    assert_equal 4, keys.length
    assert_equal 4, offsets.length
  end

  def test_create_shift_sets
    message = 'wonderful little message!'
    message_split = parse_message(message)
    indexes = message_alphabet_indexes(message_split)

    expected = [[22, 14, 13, 3], [4, 17, 5, 20],
                [11, 26, 11, 8], [19, 19, 11, 4],
                [26, 12, 4, 18], [18, 0, 6, 4], ['!']]

    assert_equal expected, create_shift_sets(indexes)
  end

  def test_shift_can_be_added_shift_sets
    new_key = Key.new('04039')
    new_date = Offset.new('140122')
    shift = create_shift(new_key, new_date)
    message = 'wonderful little message!'
    message_split = parse_message(message)
    indexes = message_alphabet_indexes(message_split)
    shift_sets = create_shift_sets(indexes)

    expected = "diytmlqjtuwyanwuhgph vru"

    assert_equal expected, add_shift_to_indexes(shift_sets, shift)
  end
end
