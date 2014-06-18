FactoryGirl.define do
  factory :comment do
    post
    author { Faker::Name.name }
    author_website { Faker::Internet.url }
    body { Faker::Lorem.sentences(3).join(' ')  }
  end

  factory :invalid_comment, parent: :comment do
    post
    author nil
  end
end
