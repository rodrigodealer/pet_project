require 'rails_helper'

RSpec.describe Plan, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.label = 'Anything'
    subject.period = 1
    subject.value = 1
    expect(subject).to be_valid
  end

  it 'is invalid with valid attributes' do
    expect(subject).to be_invalid
  end
end
