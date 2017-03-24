FactoryGirl.define do
  factory :order do
    user nil
    plan nil
    items "MyText"
    total ""
    shipping_address nil
    billing_address nil
  end
end
