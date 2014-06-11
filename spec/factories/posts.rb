FactoryGirl.define do
  factory :post do
    title 'My first post'
    body "Hello, Cucumber"
    posted DateTime.now
  end
end
