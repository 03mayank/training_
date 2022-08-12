def parse(item_list, new_reciept)
  obj = []
  i = 0
  extempted_good = ['book', 'books' 'food', 'chocolate', 'chocolates', 'medicine', 'pills']
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

    item_name = temp_list_item[1..-3].join(' ')
    quantity = temp_list_item[0]    
    price = temp_list_item.last()
    # puts quantity, item_name, price, exempted_flag, import_flag
    obj[i] = Product.new(quantity, item_name, price, exempted_flag, import_flag)
    new_reciept.add_to_reciept(obj[i])
    i += 1
  end
end

