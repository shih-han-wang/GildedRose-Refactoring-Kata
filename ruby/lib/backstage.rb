require_relative 'quality'
require_relative 'sell_in'
module Backstage

  def self.update(item)
    Sell_in::change(item)
    if item.sell_in < 0
      Quality::set(item, 0)
    elsif item.sell_in < 5
      Quality::increases(item, 3)
    elsif item.sell_in < 10
      Quality::increases(item, 2)
    else
      Quality::increases(item, 1)
    end
    Quality::max(item, 50)
  end

end
