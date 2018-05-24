require_relative './item.rb'
class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      return stay_still(item) if item.stay_still_category
      return quality_increases(item, 1) if item.increase_category
      return quality_nonlinear_increase(item) if item.nonlinear_increase_category
      return quality_degrades(item, 2) if item.twice_degrade_category
      quality_degrades(item, 1)
    end
  end

private

  def quality_degrades(item, num)
    item.sell_in -= 1
    item.sell_in < 0 ? item.quality -= (num * 2) : item.quality -= num
    quality_min(item, 0)
  end

  def quality_increases(item, num)
    item.sell_in -= 1
    item.quality += num
    quality_max(item, 50)
  end

  def quality_nonlinear_increase(item)
    item.sell_in -= 1
    item.sell_in < 0 ? item.quality = 0 : item.sell_in < 5 ? item.quality += 3 : item.sell_in < 10 ? item.quality += 2 : item.quality += 1
    quality_max(item, 50)
  end

  def stay_still(item)
    item.sell_in = item.sell_in
    item.quality = item.quality
  end

  def quality_max(item, num)
    item.quality = num if item.quality > num
  end

  def quality_min(item, num)
    item.quality = num if item.quality < num
  end

end
