
def stock_picker(
  array=[17,3,6,9,15,8,6,1,10], 
  min={
    value: 99,
    index: 0
  }, 
  max={
    value: 0,
    index: 0
  }
  )

  # Step 1. Find the smallest number.
  def find_min(array, min)
    array.each_with_index do |number, index|
      if number < min[:value]
        min[:value] = number
        min[:index] = index
      end
    end
  end
  
  # Step 2. Find largest number after the smallest number.
  def find_max(array, min, max)
    array[min[:index]..-1].each_with_index do |number, index|
      if number > max[:value]
        max[:value] = number
        max[:index] = index
      end
    end
  end
  
  # Step 3. Calculate the difference.
  def calculate_difference(min, max)
    difference = max[:value] - min[:value]
  end

  def init(array, min, max, difference=0, result={buy: 0, sell: 0})
    og_array = [17,3,6,9,15,8,6,1,10]
    array.length.times do
      find_min(array, min)
      find_max(array, min, max)
      calculated_difference = calculate_difference(min, max)

      if calculated_difference > difference
        difference = calculated_difference
        og_array.each_with_index do |number, index|
          if number == min[:value]
            result[:buy] = index
          end
          if number == max[:value]
            result[:sell] = index
          end
        end
      end

      array.delete_at(min[:index])
      min = {value: 99, index: 0}
      max = {value: 0, index: 0}
    end
    return result
  end
  result = init(array, min, max)
  return p([result[:buy], result[:sell]])
end

stock_picker()