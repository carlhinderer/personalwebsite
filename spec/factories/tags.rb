FactoryGirl.define do
  factory :tag do
    name 'cobol'
  end

  factory :invalid_tag, parent: :tag do 
    name nil
  end
end
