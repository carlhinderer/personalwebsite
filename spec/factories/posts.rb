FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.words(10).join(' ') }
    body { Faker::Lorem.paragraphs(5).join(' ') }
    posted DateTime.now
    category 
  end

  factory :invalid_post, parent: :post do
    title nil
  end
end
