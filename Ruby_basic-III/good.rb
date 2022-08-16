require_relative "print_reciept.rb"
require_relative "Input_parshing.rb"

class Product
  attr_accessor :quantity, :item_name, :price, :exempted_flag, :import_flag, :tax, :is_valid
  def initialize(quantity, item_name, price, exempted_flag, import_flag, is_valid)
    @quantity = quantity
    @item_name = item_name
    @price = price.to_f
    @exempted_flag = exempted_flag
    @import_flag = import_flag
    @is_valid = is_valid
    # @tax = 0
    @tax_rate = 0.00
  end

  def tax_calculator
    if is_valid == true
      if @exempted_flag == false and @import_flag == true
        @tax = @price * 0.15
      elsif @exempted_flag == false and @import_flag == false
        @tax = @price * 0.10
      elsif @exempted_flag == true and @import_flag == true
        @tax = @price * 0.05
      else
        @tax = 0.00
      end
    end
  end
end

new_reciept = Reciept.new
item_list = []
item = ''
while(item != 'q')
  item = gets.chomp()
  item_list.push(item)
end
item_list.pop()
parse(item_list, new_reciept)

puts new_reciept.print_list

# Input 1 =>
# 1 book at 12.49
# 1 music CD at 14.99
# 1 chocolate bar at 0.85

# Output 1 =>
# 1 book : 12.49
# 1 music CD : 16.489
# 1 chocolate bar : 0.85
# Sales Taxes: 1.5
# Total: 29.83

# Input 2 =>
# 1 imported box of chocolates at 10.00
# 1 imported bottle of perfume at 47.50

# Output 2=>
# 1 imported box of chocolates : 10.5
# 1 imported bottle of perfume : 54.625
# Sales Taxes: 7.63
# Total: 65.13

# Input 3=>
# 1 book at 12.49
# -1 music CD at 14.99
# 1 chocolate bar at 0.85

# Output
# 1 book : 12.49
# Invalid input
# 1 chocolate bar : 0.85
# Sales Taxes: 0.0
# Total: 13.34


