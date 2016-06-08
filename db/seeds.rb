# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [ { title: "food" },
               { title: "parts" },
               { title: "clothing" },
               { title: "livestock" },
               { title: "ammunition" }
             ]

items = [
        { title: "Pick Axe",
          price: 15,
          description: "Picks things",
          image_path: "http://vignette3.wikia.nocookie.net/mafiawars/images/1/14/Huge_item_pickaxe_01.png/revision/latest?cb=20120917074243",
          category_id: 2
        },
        { title: "Wagon Wheel",
          price: 80,
          description: "Makes that wagon go",
          image_path: "http://comps.gograph.com/big-vintage-rustic-wagon-wheel_gg64416381.jpg",
          category_id: 2
        },
        { title: "Canvas Cover",
          price: 10,
          description: "covers yer wagon",
          image_path: "http://www.mytarp.com/images/categories/canvas-covers-untreated/natural-canvas-duck-tarps_0443_250x250.jpg",
          category_id: 2
        },
        { title: "Ammunition",
          price: 100,
          description: "How else you gonna kill Buffalo?",
          image_path: "http://gunsmagazine.com/wordpress/wp-content/uploads/2015/02/number7.jpg",
          category_id: 5
        },
        { title: "Britches",
          price: 5,
          description: "Covers yer rear end",
          image_path: "http://www.grandmajudyscreations.com/files/3952366/uploaded/britches%20007.jpg",
          category_id: 3
        }]


  categories.each do |attribute|
    category = Category.create(attribute)
    puts "#{category.title} successfully created!"
  end

   items.each do |data|
     item = Item.create(data)
     puts "#{item.title} successfully created"
   end
