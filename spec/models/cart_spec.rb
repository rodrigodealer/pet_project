require 'rails_helper'
require 'mock_redis'

RSpec.describe Cart, type: :model do
  subject { described_class.new(1) }

  let(:redis) { MockRedis.new }

  describe 'duplication protection for cart' do
    let(:obj1) { [{'product_id' => '1', 'qty' => '1', 'property' => { 'Tamanho' => 'G', 'Cor' => 'Preto', 'Tipo' => 'Gato' }}] }
    let(:obj2) { [{'product_id' => '1', 'qty' => '3', 'property' => { 'Tamanho' => 'G', 'Cor' => 'Preto', 'Tipo' => 'Gato' }}] }
    let(:obj3) { [{'product_id' => '1', 'qty' => '3', 'property' => { 'Tamanho' => 'G', 'Cor' => 'Preto', 'Tipo' => 'Cachorro' }}] }

    before do
      allow(Redis).to receive(:new) { redis }
    end

    it 'has an item and tries to add the same' do
      result1 = subject.with_items(obj1)
      result2 = subject.with_items(obj2)

      expect(result1.items.size).to be_eql(1)
      expect(result2.items.size).to be_eql(1)
      expect(result2.items.first['qty']).to be_eql('4')
    end

    it 'has two items (equal items) and add a new one' do
      subject.with_items(obj1)
      subject.with_items(obj2)
      result3 = subject.with_items(obj3)

      expect(result3.items.size).to be_eql(2)
      expect(result3.items.first['qty']).to be_eql('4')
      expect(result3.items.last['qty']).to be_eql('3')
    end
  end

  it 'has user_id eq to 1' do
    expect(subject.user_id).to eq(1)
  end

  it 'has empty items' do
    expect(subject.items).to eq([])
  end

  it 'adds items based on json' do
    json = "[{\"product_id\":\"1\"}]"
    expect(subject.with_json_items(json).items).to eq([{'product_id' => '1'}])
  end

  it 'adds items based on object' do
    obj = [{'product_id' => '1'}]
    expect(subject.with_items(obj).items).to eq([{'product_id' => '1'}])
  end

  it 'gets the unknown cart' do
    allow(Redis).to receive(:new) { redis }

    expect(Cart.get(1).user_id).to eq(1)
  end

  it 'gets the known cart' do
    allow(redis).to receive(:get).with(1) { "[{\"product_id\":\"1\",\"qty\":\"1\",\"property\":{\"Tamanho\":\"G\",\"Cor\":\"Preto\",\"Tipo\":\"Gato\"}}]" }
    allow(Redis).to receive(:new) { redis }

    expect(Cart.get(1).user_id).to eq(1)
    expect(Cart.get(1).items).to_not be_empty
  end

  it 'saves' do
    allow(Redis).to receive(:new) { redis }
    obj = [{'product_id' => '1'}]

    result = subject.with_items(obj).save

    expect(result).to be_eql(obj.to_json)
    expect(redis.get('1')).to eq("[{\"product_id\":\"1\"}]")
  end
end
