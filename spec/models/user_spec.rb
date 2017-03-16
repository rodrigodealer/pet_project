require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new }

  it 'is invalid' do
    expect(subject).to be_invalid
  end

  it 'is valid' do
    subject.email = 'test@test.com'
    subject.password = '12345678'
    expect(subject).to be_valid
  end

  it 'validates invalid kind' do
    subject.email = 'test@test.com'
    subject.password = '12345678'
    subject.kind = 'G'
    expect(subject).to be_invalid
  end

  it 'validates kind' do
    subject.email = 'test@test.com'
    subject.password = '12345678'
    subject.kind = 'U'
    expect(subject).to be_valid
  end

  it 'validates kind' do
    subject.email = 'test@test.com'
    subject.password = '12345678'
    subject.kind = 'A'
    expect(subject).to be_valid
  end

  it 'gets the same uuid' do
    subject.id = 1000
    expect(subject.uuid).to be_eql('10')
  end
end
