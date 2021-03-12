require_relative '../lib/gilded_rose'

describe GildedRose do

  describe '#update_quality' do
    context 'when the item is Elixir of the Mongoose' do
     
      it 'updates the quality value of the below item by -1 each day' do 
        items = [Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7)]
        GildedRose.new(items).stock_update()
        expect(items[0].quality).to eq 6
      end 
      
      it 'updates the sell_in value of the below item by -1 each day' do 
        items = [Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7)]
        GildedRose.new(items).stock_update()
        expect(items[0].sell_in).to eq 4
      end 

      it 'degrades quality twice as fast once sell by date has passed' do
        items = [Item.new(name="Elixir of the Mongoose", sell_in=-1, quality=7)]
        GildedRose.new(items).stock_update()
        expect(items[0].quality).to eq 5
      end

      it 'does not reduce the quality beyond 0' do
        items = [Item.new(name="Elixir of the Mongoose", sell_in=5, quality=0)]
        GildedRose.new(items).stock_update()
        expect(items[0].quality).to eq 0
      end   
    end
  end

  describe '#update_quality' do 
    context 'when the item is Aged Brie' do

      it 'increases in quality value as it gets older' do
        items = [Item.new(name="Aged Brie", sell_in=2, quality=0)]
        GildedRose.new(items).stock_update()
        expect(items[0].quality).to eq 1
        expect(items[0].sell_in).to eq 1
      end 

      it 'never has a quality value above 50' do
        items = [Item.new(name="Aged Brie", sell_in=2, quality=50)]
        GildedRose.new(items).stock_update()
        expect(items[0].quality).to eq 50
      end
    end 
  end

  describe '#update_quality' do 
    context 'when the item is Sulfuras, Hand of Ragnaros' do 

      it 'has a quality value of 80 which never alters' do 
        items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80)]
        GildedRose.new(items).stock_update()
        expect(items[0].quality).to eq 80
      end

      it 'had a sell_in value which never alters' do 
        items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80)]
        GildedRose.new(items).stock_update()
        expect(items[0].sell_in).to eq -1
      end
    end 
  end

  describe '#update_quality' do 
    context 'when the item is Backstage passes to a TAFKAL80ETC concert' do 

      it 'increases in quality value, liked Aged Brie, as the item gets older' do 
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20)]
        GildedRose.new(items).stock_update()
        expect(items[0].sell_in).to eq 14 
        expect(items[0].quality).to eq 21
      end
      
      it 'increases in quality value x2 each day when there are 10 days or less' do 
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=9, quality=20)]
        GildedRose.new(items).stock_update()
        expect(items[0].sell_in).to eq 8
        expect(items[0].quality).to eq 22
      end 

      it 'increases in quality value x3 each day when there are 5 days or less' do 
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=4, quality=20)]
        GildedRose.new(items).stock_update()
        expect(items[0].sell_in).to eq 3
        expect(items[0].quality).to eq 23
      end 

      it 'drops to a quality value of 0 when the concert is over' do 
        items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=0, quality=20)]
        GildedRose.new(items).stock_update()
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).to eq 0
      end
    end
  end

  describe '#update_sell_in' do 
    it 'updates the sell_in value by -1 unless Sulfuras, Hand of Ragnaros' do 
      items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=0, quality=20)]
        GildedRose.new(items).stock_update()
        expect(items[0].sell_in).to eq -1
    end
  end 

  describe '#update_quality' do 
    context 'when the item is Aged Brie' do

      it 'increases in quality value as it gets older' do
        items = [Item.new(name="Aged Brie", sell_in=2, quality=0)]
        GildedRose.new(items).stock_update()
        expect(items[0].quality).to eq 1
        expect(items[0].sell_in).to eq 1
      end 
    end
  end
end








