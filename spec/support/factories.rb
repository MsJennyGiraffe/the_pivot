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
    role 0
    approved false
    requested false
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
    bid_status { 0 }
  end

  factory :order_item do |n|
    order
    item
  end

  factory :order do |n|
    user
    status "completed"
  end

  factory :bid do |n|
    price { rand(1..10000) }
    user
    item
  end
end
