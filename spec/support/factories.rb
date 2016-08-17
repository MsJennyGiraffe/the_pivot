FactoryGirl.define do
  sequence :username do |n|
    "User #{n}"
  end

  sequence :email do |n|
    "example#{n}@example.com"
  end

  sequence :title do |n|
    "Item #{n}"
  end

  sequence :description do |n|
    "Description #{n}"
  end

  sequence :category_name do |n|
    "Category #{n}"
  end

  factory :user do |n|
    username { generate(:username) }
    password "password"
    email { generate(:email) }
  end

  factory :category do |n|
    title { generate(:category_name)}
  end

  factory :item do |n|
    title { generate(:title) }
    buyout_price { rand(100..1000) }
    description { generate(:description) }
    category
    starting_bid { rand(1..99) }
    user
    image_path "https://image.freepik.com/free-icon/wagon_318-116334.png"
  end
end
