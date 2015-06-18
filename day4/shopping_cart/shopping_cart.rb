# CLASSES
class Item
  attr_reader :price, :discount
  def initialize(price, discount=1)
    @price = price
    @discount = discount
  end

  def apply_discount? 
    false
  end
end

class Fruit < Item
  def initialize(price, discount=0.9)
    super
  end

  def apply_discount?
    @time = Time.new
    @time.wday == 6 || @time.wday == 7
  end
end

class Houseware < Item
	def initialize(price, discount=0.95)
		super
	end

	def apply_discount?
		@price > 100
	end
end

class Cart
  def initialize
    @total = 0
    @items = 0
  end

  def add(amount, item)
  	@items += amount
    if item.apply_discount?
      @total += item.price * amount * item.discount
    else
      @total += item.price * amount
    end
  end

  def calculate_total_price
    @items > 5 ? @total * 0.9 : @total
  end
end


# SHOPPING
cart = Cart.new

banana = Fruit.new(20)
cart.add(2, banana)

orange_juice = Item.new(10)
cart.add(3, orange_juice)

rice = Item.new(1)
cart.add(3, rice)

vacuum = Houseware.new(150)
cart.add(1, vacuum)

anchovies = Item.new(2)
cart.add(3, anchovies)

puts "Your total is: $#{cart.calculate_total_price}"
