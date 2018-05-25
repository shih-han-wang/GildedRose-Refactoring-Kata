module Quality

  def self.max(item, num)
    item.quality = num if item.quality > num
  end

  def self.min(item, num)
    item.quality = num if item.quality < num
  end

  def self.degrades(item, num)
    item.sell_in < 0 ? item.quality -= (num * 2) : item.quality -= num
  end

  def self.increases(item, num)
    item.quality += num
  end

  def self.set(item, num)
    item.quality = num
  end

end
