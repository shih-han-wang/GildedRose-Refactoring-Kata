module Sell_in

  def self.change(item, num = 1)
    item.sell_in -= num
  end

end
