require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.name = 'Anything'
    subject.price = 20
    expect(subject).to be_valid
  end

  it 'is invalid with valid attributes' do
    expect(subject).to be_invalid
  end

  let(:product) { Product.new(name: 'Frontline', price: 20.0, available: true, properties: {'Color' => 'Black'}) }

  it 'serializes the properties' do
    expect(product.properties['Color']).to be_eql('Black')
  end
end
