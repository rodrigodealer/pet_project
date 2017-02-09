require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the Admin::ProductsHelper. For example:
#
# describe Admin::ProductsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Admin::ProductsHelper, type: :helper do
  subject { Product.new }

  it 'should be available' do
    subject.available = true
    expect(helper.available?(subject)).to eq('Sim')
  end

  it 'should not be available' do
    subject.available = false
    expect(helper.available?(subject)).to eq('Não')
  end

  it 'should have success class' do
    subject.available = true
    expect(helper.availability_class(subject)).to eq('success')
  end

  it 'should have danger class' do
    subject.available = false
    expect(helper.availability_class(subject)).to eq('danger')
  end
end
