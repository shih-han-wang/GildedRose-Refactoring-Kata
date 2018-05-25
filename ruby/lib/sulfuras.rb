require_relative 'quality'
require_relative 'sell_in'
module Sulfuras

  def self.update(item)
    Sell_in::change(item, 0)
    Quality::increases(item, 0)
  end

end
