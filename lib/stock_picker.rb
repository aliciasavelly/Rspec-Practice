class Array
  def stock_picker
    return [] if size <= 1
    return [0,1] if size == 2
    greatest_diff_index = []
    greatest_diff = 0
    each_with_index do |price, day|
      self[day + 1..-1].each_with_index do |price2, day2|
        if greatest_diff < price2 - price
          greatest_diff = price2 - price
          greatest_diff_index = [day, day2 + day + 1]
        end
      end
    end
    greatest_diff_index
  end

end
