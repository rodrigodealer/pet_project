require 'rails_helper'

RSpec.describe Brand, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.name = 'Anything'
    expect(subject).to be_valid
  end

  it 'is invalid with valid attributes' do
    expect(subject).to be_invalid
  end
end
