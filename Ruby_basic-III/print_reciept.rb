class Reciept
  def initialize
    @list = []
    @price_total = 0
    @tax_total = 0
  end

  def add_to_reciept(item)
    @list << item
    item.tax_calculator
    @price_total += item.price
    @tax_total += item.tax
    @grand_total = @price_total + @tax_total
  end
  
  def print_list
    puts
    puts "Output=>"
    @list.each do |product|
      puts "#{product.quantity} " + "#{product.item_name}" + " : " + "#{product.price + product.tax}"
    end
    puts "Sales Taxes: " + "#{(@grand_total - @price_total).round(2)}" 
    puts "Total: "+"#{@grand_total.round(2)}"
  end
end


