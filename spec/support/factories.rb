FactoryGirl.define do

  sequence :item_title do |n|
    "Item Title #{n}"
  end

  sequence :description do |n|
    "Description #{n}"
  end

  factory :item do |n|
    title { generate(:item_title) }
    price { rand(1..10) }
    description
    image_path "https://image.freepik.com/free-icon/wagon_318-116334.png"
    category
    weight 10
  end

  sequence :category_title do |n|
    "Category_#{n}"
  end

  factory :category do
    title { generate(:category_title) }
  end

  factory :user do
    password "password"
    username "username"
    email "email"
    role 0
  end

  factory :order do
    user
    status "ready"

    factory :order_with_items do
      items { create_list(:item, 3) }
    end
  end

  factory :order_item do
    order
    item
  end

  factory :reservation do
    pickup_time DateTime.now.beginning_of_day + 10.hour + 1.day
    order { build(:order_with_items) }
  end
end
