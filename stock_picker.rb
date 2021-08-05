def stock_picker(array)
  p(array)

  min = {
    value: 99,
    index: 0
  }

  max = {
    value: 0,
    index: 0
  }

  difference = 0;

  # Step 1. Find the smallest number.
  array.each_with_index do |number, index|
    if number < min[:value]
      min[:value] = number
      min[:index] = index
    end
  end
  p("min: #{min}")

  # Step 2. Find largest number after the smallest number.
  array[min[:index]..-1].each_with_index do |number, index|
    if number > max[:value]
      max[:value] = number
      max[:index] = index
    end
  end
  p("max: #{max}")

  # Step 3. Calculate the difference.
  difference = max[:value] - min[:value]
  p(difference)
  # Step 4. Repeat this process where the smallest number is the next smallest after the previous one.
  # Step 5. Return indexes of the numbers with greatest difference.
end

stock_picker([17,3,6,9,15,8,6,1,10])