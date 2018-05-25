require 'gilded_rose'

describe GildedRose do

  describe "#update_quality for normal item" do

    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq "foo"
    end

    it "Quality degrades" do
      items = [Item.new("+5 Dexterity Vest", 10, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
      expect(items[0].quality).to eq 19
    end

    it "The sell by date has passed, Quality degrades twice as fast" do
      items = [Item.new("+5 Dexterity Vest", 10, 20)]
      g = GildedRose.new(items)
      11.times { g.update_quality }
      expect(items[0].sell_in).to eq(-1)
      expect(items[0].quality).to eq 8
    end

    it "The Quality of an item is never negative" do
      items = [Item.new("Elixir of the Mongoose", 5, 7)]
      g = GildedRose.new(items)
      7.times { g.update_quality }
      expect(items[0].sell_in).to eq(-2)
      expect(items[0].quality).to eq 0
    end
  end

  describe "#update_quality for 'Aged Brie'" do

    it "Increases in Quality the older it gets" do
      items = [Item.new('Aged Brie', 2, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 1
      expect(items[0].quality).to eq 1
    end

    it "is never more than 50" do
      items = [Item.new('Aged Brie', 2, 0)]
      g = GildedRose.new(items)
      52.times { g.update_quality }
      expect(items[0].sell_in).to eq(-50)
      expect(items[0].quality).to eq 50
    end
  end

  describe "#update_quality for 'Sulfuras'" do

    it "never has to be sold or decreases in Quality" do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 0
      expect(items[0].quality).to eq 80
    end

  end

  describe "#update_quality for 'Backstage passes'" do

    it "Increases in Quality the older it gets" do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 14
      expect(items[0].quality).to eq 21
    end

    it "Quality is never more than 50" do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
      expect(items[0].quality).to eq 50
    end

    it "Increases by 2 when there are 10 days or less" do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 33)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 9
      expect(items[0].quality).to eq 35
    end

    it "Increases by 3 when there are 5 days or less" do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 44)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 4
      expect(items[0].quality).to eq 47
    end

    it "Quality drops to 0 after the concert" do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 44)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq(-1)
      expect(items[0].quality).to eq 0
    end

  end

  describe "#update_quality for 'Conjured'" do

    it "degrade in Quality twice as fast as normal items" do
      items = [Item.new('Conjured Mana Cake', 3, 6)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 2
      expect(items[0].quality).to eq 4
    end

    it "The Quality of an item is never negative" do
      items = [Item.new('Conjured Mana Cake', 3, 6)]
      g = GildedRose.new(items)
      8.times { g.update_quality }
      expect(items[0].sell_in).to eq(-5)
      expect(items[0].quality).to eq 0
    end

  end

end
