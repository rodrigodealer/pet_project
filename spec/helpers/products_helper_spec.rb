require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ProductsHelper. For example:
#
# describe ProductsHelper do
#   describe 'string concat' do
#     it 'concats two strings with spaces' do
#       expect(helper.concat_strings('this','that')).to eq('this that')
#     end
#   end
# end
RSpec.describe ProductsHelper, type: :helper do
  let(:items) { [['G', 20], ['P', 30], ['M', 10]] }

  it 'label_for_properties' do
    expect(helper.label_for_properties(items).first).to eq(['G - R$ 20', 'G'])
    expect(helper.label_for_properties(items)[1]).to eq(['P - R$ 30', 'P'])
    expect(helper.label_for_properties(items).last).to eq(['M - R$ 10', 'M'])
  end

  it 'qty_items' do
    expect(helper.qty_items).to eq([[1,1], [2,2],[3,3],[4,4],[5,5],[6,6],[7,7], [8,8], [9,9], [10,10]])
  end
end
