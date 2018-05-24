require_relative './item.rb'
class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      return quality_degrades_by_2(item) if item.name == 'Conjured Mana Cake'
      return stay_still(item) if item.name == 'Sulfuras, Hand of Ragnaros'
      return quality_increases(item) if item.name == 'Aged Brie'
      quality_degrades(item)
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

  def quality_increases(item)
    item.sell_in -= 1
    return if item.quality == 50
    item.quality += 1
  end

  def stay_still(item)
    item.sell_in = item.sell_in
    item.quality = item.quality
  end


end
