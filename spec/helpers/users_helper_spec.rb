require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  describe '#user_link' do
    subject { User.new(uid: 10) }

    it 'generates the link' do
      expect(helper.user_link(subject)).to match(/http:\/\/graph.facebook.com\/10\/picture/)
    end
  end
end
