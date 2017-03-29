FactoryGirl.define do
  factory :user do
    email "MyString@my.test"
    password "MyString"
    uuid SecureRandom.uuid
  end
end
