require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/offset'

class OffsetTest < Minitest::Test
  def test_offset_exists
    offset1 = Offset.new

    assert_instance_of Offset, offset1
  end

  def test_offset_can_have_dates
    offset1 = Offset.new('110120')
    offset2 = Offset.new

    date = Time.now.strftime('%d%m%y')

    assert_equal '110120', offset1.date
    assert_equal date, offset2.date
  end

  def test_create_offset_method
    offset1 = Offset.new('110120')
    offset2 = Offset.new
    offset2.stubs(:date).returns('140122')

    expected = offset1.create_offset(offset1.date)
    expected2 = offset2.create_offset(offset2.date)

    assert_equal [4, 4, 0, 0], expected
    assert_equal [4, 8, 8, 4], expected2
  end

  def test_split_date_set
    offset1 = Offset.new('110120')
    offset2 = Offset.new
    offset2.stubs(:date).returns('140122')

    expected1 = offset1.split_date_set(offset1.date.to_i**2)
    expected2 = offset2.split_date_set(offset2.date.to_i**2)

    assert_equal ["4", "4", "0", "0"], expected1
    assert_equal ["4", "8", "8", "4"], expected2
  end

  def test_dates_to_integers
    offset1 = Offset.new('110120')
    offset2 = Offset.new
    offset2.stubs(:date).returns('140122')

    expected1 = offset1.split_date_set(offset1.date.to_i**2)
    expected2 = offset2.split_date_set(offset2.date.to_i**2)

    assert_equal [4, 4, 0, 0], offset1.dates_to_integers(expected1)
    assert_equal [4, 8, 8, 4], offset2.dates_to_integers(expected2)
  end
end
