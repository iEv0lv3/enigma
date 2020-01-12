class Offset
  attr_reader :date

  def initialize(date = '')
    @date = (date.empty? ? (Time.now.strftime('%d%m%y')) : date)
  end

  def create_offset(date)
    date_set = date.to_i * date.to_i
    split_date_set(date_set)
  end

  def split_date_set(date_set)
    date_split = date_set.to_s.split(//)
    date_split[-4..-1]
  end
end
