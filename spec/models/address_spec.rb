require 'rails_helper'

RSpec.describe Address, type: :model do
  subject { Address.new }

  it 'validates label' do
    expect(subject).to be_invalid
  end

  it 'validates street' do
    subject.label = 'My Address'
    expect(subject).to be_invalid
  end

  it 'validates number' do
    subject.label = 'My Address'
    subject.street = 'Street'
    expect(subject).to be_invalid
  end

  it 'validates neighborhood' do
    subject.label = 'My Address'
    subject.street = 'Street'
    subject.number = 10
    expect(subject).to be_invalid
  end

  it 'validates zip' do
    subject.label = 'My Address'
    subject.street = 'Street'
    subject.number = 10
    subject.neighborhood = 'My neighborhood'
    expect(subject).to be_invalid
  end


  it 'validates type presence' do
    subject.label = 'My Address'
    subject.street = 'Street'
    subject.number = 10
    subject.neighborhood = 'My neighborhood'
    subject.zip = 'zip'
    expect(subject).to be_invalid
  end

  it 'validates kind value' do
    subject.label = 'My Address'
    subject.street = 'Street'
    subject.number = 10
    subject.neighborhood = 'My neighborhood'
    subject.zip = 'zip'
    subject.kind = 'T'
    expect(subject).to be_invalid
  end

  it 'is valid' do
    subject.label = 'My Address'
    subject.street = 'Street'
    subject.number = 10
    subject.neighborhood = 'My neighborhood'
    subject.zip = 'zip'
    subject.kind = 'B'
    expect(subject).to be_valid
  end

  it 'is valid' do
    subject.label = 'My Address'
    subject.street = 'Street'
    subject.number = 10
    subject.neighborhood = 'My neighborhood'
    subject.zip = 'zip'
    subject.kind = 'S'
    expect(subject).to be_valid
  end
end
