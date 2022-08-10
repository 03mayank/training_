def tax_rate_calculator(exempted_flag, import_flag)
  tax_rate = 0.00
  if exempted_flag == false
    tax_rate = tax_rate + 0.10
  end
  if import_flag == true
    tax_rate = tax_rate + 0.05
  end
  return tax_rate
end

def Sales_tax(item_list)
  extempted_good = ['book', 'books' 'food', 'chocolate', 'chocolates', 'medicine', 'pills']
  old_sum = 0
  new_sum = 0
  for item in item_list do
    temp_list_item = item.split()
    exempted_flag = false
    import_flag = false
    
    for item in temp_list_item
      if extempted_good.include? item 
        exempted_flag = true
      end 
    end
    
    if temp_list_item.include? 'imported'
      import_flag = true
    end

    tax_rate = tax_rate_calculator(exempted_flag, import_flag)
    old_sum += Float(temp_list_item.last())
    new_price = (Float(temp_list_item.last()) * tax_rate) + Float(temp_list_item.last())
    new_price = new_price * Float(temp_list_item[0])
    new_sum += new_price
    new_price = (new_price*20).ceil.round(2) / 20.0
    temp_str = temp_list_item[0..-3].join(' ')
    puts temp_str + ' : ' + String(new_price)
  end
  puts 'Sales Taxes: ' + String((new_sum - old_sum).round(2))
  puts 'Total: ' + String(new_sum.round(2))
end

item_list = []
item = ''
while(item != 'q')
  item = gets.chomp()
  item_list.push(item)
end
item_list.pop()

puts
puts 'Output =>'
Sales_tax(item_list)



# Input =>
# 1 imported bottle of perfume at 27.99
# 1 bottle of perfume at 18.99
# 1 packet of headache pills at 9.75
# 1 box of imported chocolates at 11.25

# Output =>
# 1 imported bottle of perfume : 32.2
# 1 bottle of perfume : 20.9
# 1 packet of headache pills : 9.75
# 1 box of imported chocolates : 11.85
# Sales Taxes: 6.66
# Total: 74.64



