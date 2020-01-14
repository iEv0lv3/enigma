module Character
  def create_character_array
    ("a".."z").to_a << " "
  end

  def create_character_hash
    indexes_hash = Hash.new(0)
    letters = ("a".."z").to_a << " "
    letters.each_with_index { |item, index| indexes_hash[item] = index }
    indexes_hash
  end
end
