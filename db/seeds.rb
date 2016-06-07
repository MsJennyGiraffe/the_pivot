# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

items = [ { title: "Pick Axe", price: 15, description: "Picks things", image_path: "http://vignette3.wikia.nocookie.net/mafiawars/images/1/14/Huge_item_pickaxe_01.png/revision/latest?cb=20120917074243",
            title: "Wagon Wheel", price: 80, description: "Makes that wagon go", image_path: "http://comps.gograph.com/big-vintage-rustic-wagon-wheel_gg64416381.jpg",
            title: "Canvas Cover", price: 10, description: "covers yer wagon", image_path: "http://www.mytarp.com/images/categories/canvas-covers-untreated/natural-canvas-duck-tarps_0443_250x250.jpg"
            title: "Ammunition", price: 100, description: "How else you gonna kill Buffalo?", image_path: "http://gunsmagazine.com/wordpress/wp-content/uploads/2015/02/number7.jpg"
            title: "Britches", price: 5, description: "Covers yer rear end" image_path: "http://www.grandmajudyscreations.com/files/3952366/uploaded/britches%20007.jpg"
  } ]

  items.each do |data|
    item = Item.create(data)
    puts "#{item.name} successfully created"
  end
