require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/modules/shift'
require './lib/modules/cipher'
require './lib/key'
require './lib/offset'

class ShiftTest < Minitest::Test
  include Shift
  include Cipher

  def test_keys_and_offsets_can_be_combined
    key = Key.new
    key.stubs(:digits).returns('34781')
    key.make_keys(key.digits)

    offset = Offset.new
    offset.stubs(:date).returns('160782')
    offset.create_offset(offset.date)

    expected = [35, 52, 80, 85]

    assert_equal expected, create_shift(key, offset)
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

  def test_apply_shift
    new_key = Key.new('04039')
    new_date = Offset.new('140122')
    message = 'wonderful little message!'
    encrypted_message = 'diytmlqjtuwyanwuhgph vru!'

    message_split = parse_message(message)
    shift = create_shift(new_key, new_date)
    indexes = message_alphabet_indexes(message_split)

    expected = 'diytmlqjtuwyanwuhgph vru!'

    assert_equal expected, apply_shift(indexes, shift, 'encrypt')

    message_split = parse_message(encrypted_message)
    shift = create_shift(new_key, new_date)
    indexes = message_alphabet_indexes(message_split)

    expected2 = 'wonderful little message!'

    assert_equal expected2, apply_shift(indexes, shift, 'decrypt')
  end

  def test_shift_can_be_added_to_shift_sets
    new_key = Key.new('04039')
    new_date = Offset.new('140122')
    message = 'wonderful little message!'

    message_split = parse_message(message)
    shift = create_shift(new_key, new_date)
    indexes = message_alphabet_indexes(message_split)
    shift_sets = create_shift_sets(indexes)

    expected = 'diytmlqjtuwyanwuhgph vru!'

    assert_equal expected, add_shift_to_indexes(shift_sets, shift)
  end

  def test_shift_can_be_removed_from_shift_sets
    new_key = Key.new('04039')
    new_date = Offset.new('140122')
    message = 'diytmlqjtuwyanwuhgph vru!'

    message_split = parse_message(message)
    shift = create_shift(new_key, new_date)
    indexes = message_alphabet_indexes(message_split)
    shift_sets = create_shift_sets(indexes)

    expected = 'wonderful little message!'

    assert_equal expected, remove_shift_from_indexes(shift_sets, shift)
  end
end
