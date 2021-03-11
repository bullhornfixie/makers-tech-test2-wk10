require_relative '../lib/gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "it does not change name of an item" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
     
    it "updates the quality value of an item by -1" do 
      items = [Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 6
    end 
  end
end
