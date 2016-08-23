class Seed
  def initialize
    add_sellers
    add_categories
    add_items
    add_customers
    add_pending_users
    add_platform_admin
  end

  def add_platform_admin
    jorge = User.create!({
      username:    "jorge@turing.io",
      password:    "password",
      email:       "jorge@turing.io",
      first_name:  "Jorge",
      last_name:   "Tellez",
      address:     Faker::Address.street_address,
      description: Faker::Hipster.paragraph(2),
      role:        2
    })
    add_orders(jorge)
    puts "Jorge Created"
  end

  def add_sellers
    nate = User.create!({
      username:    "nate@turing.io",
      password:    "password",
      email:       "nate@turing.io",
      first_name:  "Nate",
      last_name:   "Allen",
      address:     Faker::Address.street_address,
      description: Faker::Hipster.paragraph(2),
      approved:    true,
      role:        1
    })
    add_orders(nate)
    puts "Nate Created"

    19.times do
      user = User.create!({
        username:    Faker::Internet.user_name,
        password:    "password",
        email:       Faker::Internet.email,
        first_name:  Faker::Name.first_name,
        last_name:   Faker::Name.last_name,
        address:     Faker::Address.street_address,
        description: Faker::Hipster.paragraph(2),
        approved:    true,
        role:        1
      })
      add_orders(user)
      puts "Seller Created"
    end
  end

  def add_categories
    10.times do
      Category.create!(title: Faker::Company.buzzword)
      puts "Category Created"
    end
  end

  def add_items
    500.times do
      Item.create!({
        title:        Faker::Hipster.word,
        buyout_price: rand(100..1000),
        starting_bid: rand(10...100),
        description:  Faker::Hipster.paragraph,
        image_path:   "http://www.mariowiki.com/images/thumb/8/8f/SMB2_Koopa_Troopa.png/180px-SMB2_Koopa_Troopa.png",
        category_id:  rand(1..10),
        user_id:      rand(1..20)
      })
      puts "Item Created"
    end
  end

  def add_customers
    josh = User.create!({
      username:    "jmejia@turing.io",
      password:    "password",
      email:       "jmejia@turing.io",
      first_name:  "Josh",
      last_name:   "Mejia",
      description: Faker::Hipster.paragraph(2)
    })
    add_orders(josh)
    puts "Josh Created"

    89.times do
      user = User.create!({
        username:    Faker::Internet.user_name,
        password:    "password",
        email:       Faker::Internet.email,
        first_name:  Faker::Name.first_name,
        last_name:   Faker::Name.last_name,
        address:     Faker::Address.street_address,
        description: Faker::Hipster.paragraph(2)
      })
      add_orders(user)
      puts "Customer Created"
    end
  end

  def add_pending_users
    10.times do
      user = User.create!({
        username:    Faker::Internet.user_name,
        password:    "password",
        email:       Faker::Internet.email,
        first_name:  Faker::Name.first_name,
        last_name:   Faker::Name.last_name,
        address:     Faker::Address.street_address,
        description: Faker::Hipster.paragraph(2),
        approved:    false,
        requested:   true,
        role:        1
      })
      add_orders(user)
      puts "Pending User Created"
    end
  end

  def add_orders(user)
    10.times do
      Order.create!({
        status: "completed",
        user_id: user.id
      })
      puts "Order Created"
    end
  end
end

Seed.new
