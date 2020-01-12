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
    elements_cons
  end
end
