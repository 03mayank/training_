
#def is_exemptedGood(item)
def taxRateCalculator(exemptedFlag, importFlag)
  taxRate = 0.00
  if exemptedFlag == true and importFlag == false
    taxRate = 0.00

  elsif exemptedFlag == true and importFlag == true
    taxRate = 0.05

  elsif exemptedFlag == false and importFlag == false
    taxRate = 0.10

  else
    taxRate = 0.15
  end
  return taxRate
end


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

    taxRate = taxRateCalculator(exemptedFlag, importFlag)
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

itemList = []
item = ''
while(item != 'q')
  item = gets.chomp()
  itemList.push(item)
end
itemList.pop()







# puts
# puts 'Output =>'
# SalesTax(itemList)

# itemList2 = ['1 imported bottle of perfume at 27.99',
#   '1 bottle of perfume at 18.99',
#   '1 packet of headache pills at 9.75',
#   '1 box of imported chocolates at 11.25']

# puts
# puts 'Output 3'
# SalesTax(itemList2)

