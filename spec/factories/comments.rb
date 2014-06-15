FactoryGirl.define do
  factory :comment do
    author { Faker::Name.name }
    author_website { Faker::Internet.url }
    body { Faker::Lorem.sentences(3)  }
  end

  factory :invalid_comment, parent: :comment do
    author nil
  end
end
