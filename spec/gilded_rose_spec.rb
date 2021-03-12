require_relative '../lib/gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    context 'when the item is Elixir of the Mongoose' do
     
    it 'updates the quality value of the below item by -1 each day' do 
      items = [Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 6
    end 
    
    it 'updates the sell_in value of the below item by -1 each day' do 
      items = [Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 4
    end 

    it 'degrades quality twice as fast once sell by date has passed' do
      items = [Item.new(name="Elixir of the Mongoose", sell_in=-1, quality=7)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 5
    end

    it 'does not reduce the quality beyond 0' do
      items = [Item.new(name="Elixir of the Mongoose", sell_in=5, quality=0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end   
  end
end

  describe '#update_quality' do 
    context 'when the item is Aged Brie' do

    it 'increases in quality value as it gets older' do
      items = [Item.new(name="Aged Brie", sell_in=2, quality=0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
      expect(items[0].sell_in).to eq 1
    end 

    it 'never has a quality value above 50' do
      items = [Item.new(name="Aged Brie", sell_in=2, quality=50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end
  end 
end

  describe '#update_quality' do 
    context 'when the item is Sulfuras, Hand of Ragnaros' do 

    it 'has a quality value of 80 which never alters' do 
      items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 80
    end

    it 'had a sell_in value which never alters' do 
      items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
    end
  end 
end
end








