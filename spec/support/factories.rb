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
  end

  sequence :category_title do |n|
    "Category_#{n}"
  end

  factory :category do
    title { generate(:category_title) }
  end


end
