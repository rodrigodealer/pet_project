require 'rails_helper'
require 'mock_redis'

RSpec.describe Cart, type: :model do
  subject { described_class.new(1) }

  let(:redis) { MockRedis.new }

  it 'has user_id eq to 1' do
    expect(subject.user_id).to eq(1)
  end

  it 'has empty items' do
    expect(subject.items).to eq([])
  end

  it 'adds items based on json' do
    json = "[{\"product_id\":\"1\"}]"
    expect(subject.with_json_items(json).items).to eq([[{'product_id' => '1'}]])
  end

  it 'adds items based on object' do
    obj = [{'product_id' => '1'}]
    expect(subject.with_items(obj).items).to eq([[{'product_id' => '1'}]])
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
    
    expect(result).to be_eql([obj].to_json)
    expect(redis.get('1')).to eq("[[{\"product_id\":\"1\"}]]")
  end
end
