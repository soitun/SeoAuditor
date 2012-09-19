FactoryGirl.define do
  factory :audit do
    association :project
  end

  factory :keyword do
  	sequence(:name) 	    { |n| "testkeyword#{n}" }
  	association :project
  end

  factory :keyword_audit do
    association :audit
    association :keyword
  end

  factory :project do
  	sequence(:name) 	{ |n| "Test Project #{n}" }
  	sequence(:domain) 	{ |n| "http://www.example#{n}.com" }
  end
end