require 'rails_helper'

RSpec.describe ProductTag, type: :model do
  it { should validate_presence_of(:name) }
end
