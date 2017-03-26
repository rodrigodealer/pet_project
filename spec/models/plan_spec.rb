require 'rails_helper'

RSpec.describe Plan, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.label = 'Anything'
    subject.period = 'WD'
    expect(subject).to be_valid
  end

  it 'is invalid with valid attributes' do
    expect(subject).to be_invalid
  end

  describe '#days' do
    it 'has W as period' do
      subject.period = 'W'
      expect(subject.days).to be_eql(7)
    end

    it 'has CW as period' do
      subject.period = 'CW'
      expect(subject.days).to be_eql(15)
    end

    it 'has M as period' do
      subject.period = 'M'
      expect(subject.days).to be_eql(30)
    end

    it 'has FFD as period' do
      subject.period = 'FFD'
      expect(subject.days).to be_eql(45)
    end

    it 'has CM as period' do
      subject.period = 'CM'
      expect(subject.days).to be_eql(60)
    end

    it 'has TM as period' do
      subject.period = 'TM'
      expect(subject.days).to be_eql(90)
    end
  end
end
