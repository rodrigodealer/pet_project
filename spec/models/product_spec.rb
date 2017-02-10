require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { described_class.new }
  let(:product) { Product.new(name: 'Frontline', price: 20.0, available: true, properties: {'Color' => 'Black'}) }

  it 'is valid with valid attributes' do
    subject.name = 'Anything'
    subject.price = 20
    expect(subject).to be_valid
  end

  it 'is invalid with valid attributes' do
    expect(subject).to be_invalid
  end

  it 'serializes the properties' do
    expect(product.properties['Color']).to be_eql('Black')
  end

  it 'gets price for property' do
    product.properties = [
      'Tamanho' => [['G', 20], ['P', 30], ['M', 10]],
      'Cor' => [['Preto', 10]],
      'Tipo' => [['Gato', 20]]
    ]

    expect(product.price_for('Tipo', 'Gato')).to eq(20)
  end

  it 'gets property_titles for properties' do
    product.properties = [
      'Tamanho' => [['G', 20], ['P', 30], ['M', 10]],
      'Cor' => [['Preto', 10]],
      'Tipo' => [['Gato', 20]]
    ]

    expect(product.property_titles()).to eq(['Tamanho', 'Cor', 'Tipo'])
  end

  it 'gets items_for in a property' do
    product.properties = [
      'Tamanho' => [['G', 20], ['P', 30], ['M', 10]],
      'Cor' => [['Preto', 10]],
      'Tipo' => [['Gato', 20]]
    ]

    expect(product.items_for('Tamanho')).to eq([['G', 20], ['P', 30], ['M', 10]])
  end

  it 'gets the final price on a combination (getting the biggest)' do
    product.properties = [
      'Tamanho' => [['G', 40], ['P', 30], ['M', 10]],
      'Cor' => [['Preto', 10]],
      'Tipo' => [['Gato', 20]]
    ]

    expect(product.final_price(size: ['Tamanho','G'], color: ['Cor','Preto'], type: ['Tipo','Gato'])).to eq(40)
  end
end
