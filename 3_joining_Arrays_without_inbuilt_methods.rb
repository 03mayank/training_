arr1 = [1, 2, 3, 4, 5]
arr2 = [6, 7, 8, 9, 0]
arr3 = Array.new(arr1.size + arr2.size, 0)
for i in 0..arr1.size-1 do
  arr3[i] = arr1[i]
end
j = 0
for i in arr1.size..arr3.size-1 do
  arr3[i] = arr2[j]
  j += 1
end
puts arr3

