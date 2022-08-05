arr1 = [1, 2, 3, 'a', 4,'str', 6, 7, 8.45, 9, nil]
arr1 = arr1.compact
arr2 = arr1.map{ |element| element.is_a?(String) ? element : element * 2 }

puts arr2

