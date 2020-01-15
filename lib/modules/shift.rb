require_relative 'character'

module Shift
  include Character

  def create_shift(new_key, new_date)
    shift_key = new_key.make_keys(new_key.digits)
    shift_offset = new_date.create_offset(new_date.date)
    key_plus_offset(shift_key, shift_offset)
  end

  def key_plus_offset(shift_key, shift_offset)
    shift_offset.zip(shift_key.cycle).map(&:sum)
  end

  def apply_shift(indexes, shift, flag)
    shift_sets = create_shift_sets(indexes)
    if flag == 'encrypt'
      add_shift_to_indexes(shift_sets, shift)
    elsif flag == 'decrypt'
      remove_shift_from_indexes(shift_sets, shift)
    end
  end

  def create_shift_sets(indexes)
    shift_sets = []
    indexes.each_slice(4) { |set| shift_sets << set }
    shift_sets
  end

  def add_shift_to_indexes(shift_sets, shift)
    alphabet = create_character_array
    cipher_set = []
    shift_sets.each do |char_set|
      char_set.each_with_index do |char, index|
        if char.is_a?(Integer) == false
          cipher_set.push(char)
        else
          cipher_set.push(alphabet.rotate(shift[index])[char])
        end
      end
    end
    cipher_set.join
  end

  def remove_shift_from_indexes(shift_sets, shift)
    alphabet = create_character_array
    cipher_set = []
    shift_sets.each do |char_set|
      char_set.each_with_index do |char, index|
        if char.is_a?(Integer) == false
          cipher_set.push(char)
        else
          cipher_set.push(alphabet.rotate(-shift[index])[char])
        end
      end
    end
    cipher_set.join
  end
end
