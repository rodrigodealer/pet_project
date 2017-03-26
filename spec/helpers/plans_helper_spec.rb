require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PlansHelper. For example:
#
# describe PlansHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PlansHelper, type: :helper do
  describe '#real_name' do
    it 'when W' do
      expect(helper.real_name('W')).to be_eql('Semanal')
    end

    it 'when CW' do
      expect(helper.real_name('CW')).to be_eql('Quinzenal')
    end

    it 'when M' do
      expect(helper.real_name('M')).to be_eql('Mensal')
    end

    it 'when FFD' do
      expect(helper.real_name('FFD')).to be_eql('45 dias')
    end

    it 'when CM' do
      expect(helper.real_name('CM')).to be_eql('Bimestral')
    end

    it 'when blah' do
      expect(helper.real_name('blah')).to be_eql('Outro')
    end
  end
end
