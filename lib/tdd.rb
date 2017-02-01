class Array
  def my_uniq
    unique_array = []
    each do |el|
      unique_array << el unless unique_array.include?(el)
    end

    unique_array
  end

  def my_two_sum
    pairs = []
    each_with_index do |el, idx|
      self[idx + 1..-1].each_with_index do |el2, idx2|
        pairs << [idx, idx2 + idx + 1] if el + el2 == 0
      end
    end
    pairs
  end
end

def my_transpose(array)
  return array if array.any? { |el| !el.is_a?(Array) }
  transpose_arr = []

  array.each_with_index do |row, idx|
    row.each_with_index do |item, idx2|
      if transpose_arr[idx2].nil?
        transpose_arr[idx2] = [item] unless item.nil?
      else
        transpose_arr[idx2] << item unless item.nil?
      end
    end
  end

  transpose_arr
end
