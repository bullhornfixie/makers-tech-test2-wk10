require_relative '../lib/item'

describe Item do
  before(:each) do 
    @item = Item.new('Exclusive Item', 5, 8)
  end 

  it 'is instantiated with a name' do 
    expect(@item.name).to eq 'Exclusive Item'
  end

  it 'is instantiated with a sell_in value which is days to sell item' do 
    expect(@item.sell_in).to eq 5
  end

  it 'is instantiated with a quality value which is how valuable item is' do 
    expect(@item.quality).to eq 8
  end
end


