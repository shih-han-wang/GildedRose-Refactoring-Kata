require_relative 'item'
require_relative 'sulfuras'
require_relative 'backstage'
require_relative 'conjured'
require_relative 'aged'
require_relative 'normal'
class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case item.name
      when 'Sulfuras, Hand of Ragnaros'
        Sulfuras::update(item)
      when 'Aged Brie'
        Aged::update(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        Backstage::update(item)
      when 'Conjured Mana Cake'
        Conjured::update(item)
      else
        Normal::update(item)
      end
    end
  end

end
