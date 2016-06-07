# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

items = [ { name: "Pick Axe", price: 15, description: "Picks things",
            name: "Wagon Wheel", price: 80, description: "Makes that wagon go",
            name: "Canvas Cover", price: 10, description: "covers yer wagon",
            name: "Ammunition", price: 100, description: "How else you gonna kill Buffalo?",
            name: "Britches", price: 5, description: "Covers yer rear end"
  } ]

  items.each do |data|
    item = Item.create(data)
    puts "#{item.name} successfully created"
  end
