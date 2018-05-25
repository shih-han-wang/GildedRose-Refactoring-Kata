require_relative 'quality'
require_relative 'sell_in'
module Backstage

  def self.update(item)
    SellIn::change(item)
    if item.sell_in.negative?
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
