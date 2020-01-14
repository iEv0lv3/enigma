module Shift
  def create_shift(new_key, new_date)
    shift_key = new_key.make_keys(new_key.digits)
    shift_offset = new_date.create_offset(new_date.date)
    key_plus_offset(shift_key, shift_offset)
  end

  def key_plus_offset(shift_key, shift_offset)
    shift_offset.zip(shift_key.cycle).map(&:sum)
  end

  def apply_shift(indexes, shift)
    shift_sets = create_shift_sets(indexes)
    shift_indexes_sum = add_shift_to_indexes(shift_sets, shift)
    require 'pry'; binding.pry
  end

  def create_shift_sets(indexes)
    shift_sets = []
    indexes.each_slice(4) { |set| shift_sets << set }
    shift_sets
  end

  def add_shift_to_indexes(shift_sets, shift)
    shift_sets.map do |set|
      set.map do |index|
        
      end
    end
  end
end
