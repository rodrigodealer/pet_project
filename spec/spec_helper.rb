require 'simplecov'
require 'omniauth'
SimpleCov.start
RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  OmniAuth.config.test_mode = true
  omniauth_hash =
    {:provider => "facebook",
     :uid      => "1234",
     :info   => {:name       => "John Doe",
                 :email      => "johndoe@email.com"},
     :credentials => {:token => "testtoken234tsdf"}}

  omniauth_hash_without_email =
   {:provider => "facebook",
    :uid      => "1234",
    :info   => {:name       => "John Doe",
                :email      => nil},
    :credentials => {:token => "testtoken234tsdf"}}

  OmniAuth.config.add_mock(:facebook, omniauth_hash)

  OmniAuth.config.add_mock(:facebook_no_mail, omniauth_hash_without_email)

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
