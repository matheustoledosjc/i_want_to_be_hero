require 'benchmark'

# The bynary search algorithm is a way to split the search
# to find a value faster than the simple search.

def binary_search(array, target_value, start_index=0, end_index=nil)
  if end_index == nil
    end_index = array.length - 1
  end

  # when target_value is not in array
  return "Not Found" if start_index > end_index

  mid_index = (start_index + end_index) / 2

  if target_value < array[mid_index]
    return binary_search(array, target_value, start_index, mid_index - 1)
  elsif target_value > array[mid_index]
    return binary_search(array, target_value, mid_index + 1, end_index)
  else
    return "Found at index #{mid_index}"
  end
end

def simple_search(array, target_value)
  array.each_with_index do |element, index|
    return "Found at index #{index}" if element == target_value
  end

  return "Not Found"
end

sorted_array = (1..999999).to_a
value_to_find = 888555

puts "This is a simple test to compare the performance of simple search and binary search algorithms."
puts "In test we have an array with 999999 elements and we want to find the index of the value 888555."

Benchmark.bm do |x|
  x.report("Simple search") { @simple_search_result = simple_search(sorted_array, value_to_find) }
  x.report("Binary search") { @binary_search_result = binary_search(sorted_array, value_to_find) }
end

puts "Simple search result: #{@simple_search_result}"
puts "Binary search result: #{@binary_search_result}"
