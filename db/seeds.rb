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
          description: "Whether it's dislodging a stuck wheel or extracting gold, a good quality pick axe is a must have on the Oregon Trail. With a solid single wooden handle and cast steel head, durability will not be an issue.",
          image_path: "http://vignette3.wikia.nocookie.net/mafiawars/images/1/14/Huge_item_pickaxe_01.png/revision/latest?cb=20120917074243",
          category_id: 2
        },
        { title: "Wagon Wheel",
          price: 80,
          description: "Made from the finest oak to provide a solid, comfortable and steady ride while traversing the plains in your wagon. Always need a spare once you hit the Rockies.",
          image_path: "http://image.sportsmansguide.com/adimgs/l/2/235571_ts.jpg",
          category_id: 2
        },
        { title: "Canvas Cover",
          price: 10,
          description: "13-ounce army duck canvas specially treated to be mildew-proof, sun resistant and fire-resistant. Standard wagon cover measures 10' wide x 13' long. All ropes are included with our Canvas Wagon Sheet.",
          image_path: "http://www.hansenwheel.com/store/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/c/a/canvas_wagon_cover_sheet_4.jpg",
          category_id: 2
        },
        { title: "Ammunition",
          price: 100,
          description: "Variety of ammunition boxes for rifles and revolvers. Made by Winchester.",
          image_path: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRc7ka1MmQnYkG7dvLLaIj9ag2ct-Ff0I-VpvelPbfzROnoBzvT",
          category_id: 5
        },
        { title: "Breeches",
          price: 5,
          description: "Breeches in stretch woven twill are styled with a relaxed fit, comfortable wide waistband",
          image_path: "http://www.grandmajudyscreations.com/files/3952366/uploaded/britches%20007.jpg",
          category_id: 3
        },
        { title: "Chicken",
          price: 5,
          description: "Adult Chicken",
          image_path: "http://www.shauntmax30.com/data/out/8/992046-xandimus-animals-chicken.jpg",
          category_id: 4
        },
        { title: "Oxen",
          price: 20,
          description: "Oxe, sold seperately. Weight, 500lbs, trained for driving, farming, logging and pulling.",
          image_path: "https://s-media-cache-ak0.pinimg.com/736x/51/c3/7d/51c37d894a2c70373310039186bc2d24.jpg",
          category_id: 4
        },
        { title: "Bourbon",
          price: 3,
          description: "Mash Bourbon",
          image_path: "https://img0.etsystatic.com/028/1/7947782/il_570xN.581725526_7vdb.jpg",
          category_id: 1
        },
        { title: "Women's Praire Dress",
          price: 20,
          description: "Women's Praire Dress made from various canvas and cotton fabrics",
          image_path: "https://img0.etsystatic.com/064/1/9052223/il_570xN.793432310_89z9.jpg",
          category_id: 3
        },
        { title: "Hatchet",
          price: 10,
          description: "A small, light axe designed for use in one hand specifically while camping or travelling.",
          image_path: "http://vignette2.wikia.nocookie.net/fallout/images/7/78/FNVMeleeHatchet.png/revision/latest?cb=20110209091640",
          category_id: 2
        },
        { title: "Coffee",
          price: 3,
          description: "Arabic beans allow this full bodied coffee to shine!  Out on the ranch or in the comforts of home this rich deep flavor is sure to please.",
          image_path: "http://2.bp.blogspot.com/--sBByxhsqco/Uaduehe7ZjI/AAAAAAAAABo/nWHD-FKRJm4/s1600/st3.gif",
          category_id: 1
        },
        { title: "Corn Bread",
          price: 2,
          description: "Homemade Corn Bread",
          image_path: "http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2015/4/15/0/GE_Cast-Iron-Skillet-Corn-Bread_s4x3.jpg",
          category_id: 1
        }]



  categories.each do |attribute|
    category = Category.create(attribute)
    puts "#{category.title} successfully created!"
  end

   items.each do |data|
     item = Item.create(data)
     puts "#{item.title} successfully created"
   end
