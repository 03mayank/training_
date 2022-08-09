
 
def SalesTax(itemList)
  extemptedGood = ['book', 'books' 'food', 'chocolate', 'chocolates','medicine', 'pills']
  oldSum = 0
  newSum = 0
  for item in itemList do
    tempListitem = item.split()
    
    exemptedFlag = false
    importFlag = false
    
    for item in tempListitem
      if extemptedGood.include? item 
        exemptedFlag = true
      end 
    end
    
    if tempListitem.include? 'imported'
      importFlag = true
    end
    taxRate = 0.00
    # if exemptedFlag == true and importFlag == false
    #   taxRate = 0.00

    if exemptedFlag == true and importFlag == true
      taxRate = 0.05

    elsif exemptedFlag == false and importFlag == false
      taxRate = 0.10

    else
      taxRate = 0.15

    end
    
    oldSum += Float(tempListitem.last())
    newPrice = (Float(tempListitem.last()) * taxRate) + Float(tempListitem.last())
    newPrice = newPrice * Float(tempListitem[0])
    newSum += newPrice
    newPrice = (newPrice*20).ceil.round(2) / 20.0
    tempStr = tempListitem[0..-3].join(' ')
    puts tempStr + ' : ' + String(newPrice)
  end
  puts 'Sales Taxes: ' + String((newSum - oldSum).round(2))
  puts 'Total: ' + String(newSum)
end


itemList = ['1 book at 12.49',
  '1 music CD at 14.99',
  '1 chocolate bar at 0.85']

puts
puts 'Output 1'
SalesTax(itemList)

itemList = ['1 imported box of chocolates at 10.00',
  '1 imported bottle of perfume at 47.50']

puts
puts 'Output 2'
SalesTax(itemList)

  itemList = ['1 imported bottle of perfume at 27.99',
  '1 bottle of perfume at 18.99',
  '1 packet of headache pills at 9.75',
  '1 box of imported chocolates at 11.25']

puts
puts 'Output 3'
SalesTax(itemList)

