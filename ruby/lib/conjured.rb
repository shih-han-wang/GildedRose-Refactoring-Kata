require_relative 'quality'
require_relative 'sell_in'
module Conjured

  def self.update(item)
    SellIn::change(item)
    Quality::degrades(item, 2)
    Quality::min(item, 0)
  end

end
