class GildedRose
  MAX = 50
  MIN = 0 

  def initialize(items)
    @items = items
  end

  def stock_update()
    @items.each do |item|
      update_sell_in(item)
      update_quality(item)
    end
  end 

  def update_sell_in(item)
    unless item.name.include?('Sulfuras, Hand of Ragnaros')
      item.sell_in -= 1
    end
  end

  def update_quality(item)
    case 
      when item.name == 'Aged Brie' then aged_brie_update(item)
      when item.name == 'Backstage passes to a TAFKAL80ETC concert' then backstage_passes_update(item)
      when item.name == 'Sulfuras, Hand of Ragnaros' then item.quality = item.quality 
      when item.name.include?('Conjured') then conjured_item_update(item)
    else 
      standard_item_update(item)
    end
  end 

  def aged_brie_update(item)
    if item.quality < MAX 
      item.quality += 1 
    end 
  end 

  def backstage_passes_update(item)
    case 
      when item.sell_in <=0  then item.quality = 0
      when item.sell_in < 5  then item.quality += 3
      when item.sell_in < 10 then item.quality += 2
      when item.sell_in > 10 then item.quality += 1
      when item.sell_in <= 0 then item.quality -= 23
    end
  end 

  def standard_item_update(item)
    case 
      when item.quality > MIN && item.sell_in < 0 then item.quality -= 2
      when item.quality > MIN && item.sell_in > 0 then item.quality -= 1
    end 
  end 

  def conjured_item_update(item)
    case 
      when item.quality > MIN && item.sell_in < 0 then item.quality -= 4
      when item.quality > MIN && item.sell_in > 0 then item.quality -= 2
    end 
  end 
end 




