require_relative 'quality'
require_relative 'sell_in'
module Aged

  def self.update(item)
    Sell_in::change(item)
    Quality::increases(item, 1)
    Quality::max(item, 50)
  end

end
