class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def twice_degrade_category
    @name == 'Conjured Mana Cake'
  end

  def increase_category
    @name == 'Aged Brie'
  end

  def nonlinear_increase_category
    @name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def stay_still_category
    @name == 'Sulfuras, Hand of Ragnaros'
  end

end
