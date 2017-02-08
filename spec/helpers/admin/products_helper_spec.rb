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
  it 'should be available' do
    product = Product.new
    product.available = true
    expect(helper.available?(product)).to eq('Sim')
  end

  it 'should not be available' do
    product = Product.new
    product.available = false
    expect(helper.available?(product)).to eq('Não')
  end
end
