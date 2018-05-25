require 'item'

describe Item do

  describe "#initialize" do

    it "stores the name" do
      item = Item.new("foo", 0, 0)
      expect(item.name).to eq "foo"
    end

    it "stores the sell_in" do
      item = Item.new("foo", 5, 10)
      expect(item.sell_in).to eq 5
    end

    it "stores the quality" do
      item = Item.new("foo", 5, 10)
      expect(item.quality).to eq 10
    end

  end

  describe "#te_s" do

    it "return string" do
      item = Item.new("foo", 0, 0)
      expect(item.to_s()).to eq "foo, 0, 0"
    end

  end

end
