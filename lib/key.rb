class Key
  attr_reader :digits

  def initialize(key = '')
    @digits = (key.empty? ? ('%05d' % rand(5**5)) : key)
  end

  def make_keys(key)
    elements = key.split(//)
    element_cons(elements)
  end

  def element_cons(elements)
    elements_cons = []
    elements.each_cons(2) { |numbers| elements_cons << numbers }
    add_elements(elements_cons)
  end

  def add_elements(element_cons)
    element_cons.map do |element|
      element[0].to_i + element[1].to_i
    end
  end
end
