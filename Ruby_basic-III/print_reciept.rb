class Reciept
  def initialize
    @list = []
    @price_total = 0
    @tax_total = 0
  end

  def add_to_reciept(item)
    if item.is_valid == true
      @list << item
      item.tax_calculator
      @price_total += item.price
      @tax_total += item.tax
      @grand_total = @price_total + @tax_total
    else
      @list << nil
    end
  end
  
  def print_list
    puts
    puts "Output=>"
    # puts @list
    @list.each do |product|
      if product == nil
        puts "Invalid input"
        next
      end
      puts "#{product.quantity} " + "#{product.item_name}" + " : " + "#{product.price + product.tax}"
      # puts "#{product.is_valid}"
    end
    puts "Sales Taxes: " + "#{(@grand_total - @price_total).round(2)}" 
    puts "Total: "+"#{@grand_total.round(2)}"
  end
end


