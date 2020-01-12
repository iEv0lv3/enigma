require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
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

    assert_equal ['4', '4', '0', '0'], offset1.create_offset(offset1.date)
  end
end
