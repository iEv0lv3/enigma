class Offset
  attr_reader :date

  def initialize(date = '')
    @date = (date.empty? ? (Time.now.strftime('%d%m%y')) : date)
  end

  def create_offset(date)
    squared_date = date.to_i * date.to_i
    date_split = split_date_set(squared_date)
    dates_to_integers(date_split[-4..-1])
  end

  def split_date_set(squared_date)
    date_split = squared_date.to_s.split(//)
    date_split[-4..-1]
  end

  def dates_to_integers(date_split)
    date_split.map(&:to_i)
  end
end
