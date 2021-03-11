require_relative '../lib/item'

describe Item do
  before(:each) do 
    @item = Item.new('Exclusive Item', 5, 8)
  end 

  it 'is instantiated with name' do 
    expect(@item.name).to eq 'Exclusive Item'
  end
end


