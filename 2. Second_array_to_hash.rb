def frequency(arr)
    hash = Hash.new(0)
    arr.each{|key| hash[key] += 1}
    puts hash
  end
arr = [2,3,4,5,6,7,54,3,54,56,4,3,2,3,4,5,6,5,4,3,2,1,3,4,5,6,6,6,5,4,3,3,3,45,5,56,]
frequency(arr)

#output
#{2=>3, 3=>9, 4=>6, 5=>6, 6=>5, 7=>1, 54=>2, 56=>2, 1=>1, 45=>1}