require_relative './item.rb'
class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == 'Conjured Mana Cake'
        quality_degrades_by_2(item)
      else
        quality_degrades(item)
      end
    end
  end

private

  def quality_degrades(item)
    item.sell_in -= 1
    return if item.quality == 0
    item.sell_in < 0 ? item.quality -= 2 : item.quality -= 1
  end

  def quality_degrades_by_2(item)
    item.sell_in -= 1
    return if item.quality == 0
    item.sell_in < 0 ? item.quality -= 4 : item.quality -= 2
  end


end
