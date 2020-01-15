class Key
  attr_reader :digits

  def initialize(key = '')
    @digits = (key.empty? ? ('%05d' % rand(5**5)) : key)
  end

  def make_keys(key_digits)
    elements = create_key_elements(key_digits)
    cons = element_cons(elements)
    add_elements(cons)
  end

  def create_key_elements(key_digits)
    key_digits.split(//)
  end

  def element_cons(elements)
    the_cons = []
    elements.each_cons(2) { |numbers| the_cons << numbers }
    the_cons
  end

  def add_elements(element_cons)
    element_cons.map do |element|
      (element[0] + element[1]).to_i
    end
  end
end
