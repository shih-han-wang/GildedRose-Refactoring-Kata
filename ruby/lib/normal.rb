require_relative 'quality'
require_relative 'sell_in'
module Normal

  def self.update(item)
    SellIn::change(item)
    Quality::degrades(item, 1)
    Quality::min(item, 0)
  end

end
