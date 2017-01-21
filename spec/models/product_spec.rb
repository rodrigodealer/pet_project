require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:available) }
  it { should belong_to(:brand) }

  let(:product) { Product.new(name: 'Frontline', price: 20.0, available: true, properties: {'Color' => 'Black'}) }

  it 'serializes the properties' do
    expect(product.properties['Color']).to be_eql('Black')
  end
end
