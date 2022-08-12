require_relative "print_reciept.rb"
require_relative "Input_parshing.rb"

class Product
  attr_accessor :quantity, :item_name, :price, :exempted_flag, :import_flag, :tax
  def initialize(quantity, item_name, price, exempted_flag, import_flag)
    @quantity = quantity
    @item_name = item_name
    @price = price.to_f
    @exempted_flag = exempted_flag
    @import_flag = import_flag
    # @tax = 0
    @tax_rate = 0.00
  end

  def tax_calculator
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





