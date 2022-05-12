# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
require "securerandom"
require "open-uri"

# file = URI.open("https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png")
# article = Article.new(title: "NES", body: "A great console")
# article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# @article.photo.attached? #=> true/false
# @article.photo.purge #=> Destroy the photo

puts "Cleaning up database..."

Review.destroy_all
Bid.destroy_all
Item.destroy_all
#User.destroy_all
#Compound.destroy_all

puts "Database cleaned"

compound = Compound.create(name: Faker::Address.community, address: Faker::Address.street_name)

puts "Seeding users"
users = []
10.times do
  users.push(User.create!({ nickname: Faker::Name.name, is_banned: false, score: 0,
                            building_number: rand(1...5), room_number: rand(1...99),
                            compound: compound, phone_number: Faker::PhoneNumber.cell_phone,
                            avatar_url: Faker::Avatar.image(slug: "my-own-slug", size: "100x100") }))
end

puts "Seeding items"

# Standards
conditions = ["Brand new", "Almost new", "In working condition", "Broken"]
#item_names = [Faker::Appliance.equipment, Faker::Music.instrument, Faker::Camera.brand_with_model]
item_names_study = %w(橡皮 墨水 尺子 圆规 文具盒 书包 笔 书本 文具盒 电脑 iPad 亚马逊Kindle)
item_names_sport = %w(健身器材 器械 跑步机 踏步机 鞍马 铅球 标枪 跳高 起跑器 实心球 发令枪 器械 握力器 臂力器 足球 篮球 排球 乒乓球 网球 棒球 垒球 壁球 保龄球 台球 高尔夫球 围棋 象棋 扑克 滑雪镜 护腕护膝 防护眼镜 骑行镜 篮球眼镜 运动手套 运动鞋 运动服装 运动帽 运动饰品 帐篷 睡袋 折椅 登山包 运动手表 望远镜)
item_names_electric = %w(家用冰箱 冷饮机 空调器 电扇 换气扇 冷热风器 空气去湿器 清洁电器 洗衣机 干衣机 电熨斗 吸尘器 地板打蜡机 电灶 微波炉 电磁灶 电烤箱 电饭锅 洗碟机 电热水器 食物机 电暖器具 电热毯 电热被 电热服 空间加热器 整容保健电器 包括电动剃须 电风 整发器 超声波洗面器 电动器 空气负离子发生器 声像电器 电视机 收音机 录音机 录像机 摄像机 组合音响 烟火报器 电铃)
item_names_furniture = %w(被褥 床单 被套 床罩 床笠 枕套 枕芯 毯子 凉席 蚊帐 炒锅 煎锅 蒸锅 奶锅 汤煲 锅盖架 铲子 刀具 碗 盘子 筷子 勺子 叉子 餐刀 酒杯 餐垫 餐巾纸 纸巾 桌子 椅子 茶几 地柜 酒柜 装饰柜 间厅柜 鞋柜 饰物架 玄关台 衣柜 梳妆台 茶几)
item_names_fashion = %w(香奈儿 迪奥 路易威登 古驰 阿玛尼 范思哲 纪梵希 普拉达 爱马仕 卡尔文克莱恩)

puts "Seeding items:Study"
rand(10...20).times do
  item_names = [Faker::Appliance.equipment, Faker::Music.instrument, Faker::Camera.brand_with_model]
  item = Item.new({ name: item_names_study.sample, category: "学习",
                    condition: conditions.sample, image_url: "", value: 1, request: item_names.sample,
                    is_freebie: [true, false].sample, status: "avaliable", user: User.order(Arel.sql("RANDOM()")).first })
  item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
  item.save
  item.save!
end

puts "Seeding items:Sports"
rand(10...20).times do
  item_names = [Faker::Appliance.equipment, Faker::Music.instrument, Faker::Camera.brand_with_model]
  item = Item.new({ name: item_names_sport.sample, category: "体育",
                    condition: conditions.sample, image_url: "", value: 1, request: item_names.sample,
                    is_freebie: [true, false].sample, status: "avaliable", user: User.order(Arel.sql("RANDOM()")).first })
  item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
  item.save
  item.save!
end

puts "Seeding items:Electric"
rand(10...20).times do
  item_names = [Faker::Appliance.equipment, Faker::Music.instrument, Faker::Camera.brand_with_model]
  item = Item.new({ name: item_names_electric.sample, category: "电器",
                    condition: conditions.sample, image_url: "", value: 1, request: item_names.sample,
                    is_freebie: [true, false].sample, status: "avaliable", user: User.order(Arel.sql("RANDOM()")).first })
  item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
  item.save
  item.save!
end

puts "Seeding items:Furniture"
rand(10...20).times do
  item_names = [Faker::Appliance.equipment, Faker::Music.instrument, Faker::Camera.brand_with_model]
  item = Item.new({ name: item_names_furniture.sample, category: "家具",
                    condition: conditions.sample, image_url: "", value: 1, request: item_names.sample,
                    is_freebie: [true, false].sample, status: "avaliable", user: User.order(Arel.sql("RANDOM()")).first })
  item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
  item.save
  item.save!
end

puts "Seeding items:fashion"
rand(10...20).times do
  item_names = [Faker::Appliance.equipment, Faker::Music.instrument, Faker::Camera.brand_with_model]
  item = Item.new({ name: item_names_fashion.sample, category: "时尚",
                    condition: conditions.sample, image_url: "", value: 1, request: item_names.sample,
                    is_freebie: [true, false].sample, status: "avaliable", user: User.order(Arel.sql("RANDOM()")).first })
  item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
  item.save
  item.save!
end

first_userid = User.first.id
last_userid = User.last.id
first_itemid = Item.first.id
last_itemid = Item.last.id
puts "Seeding bids"

10.times do
  bid = Bid.new(
    user_id: rand(first_userid...last_userid),
    owner_item_id: SecureRandom.random_number(first_itemid...last_itemid),
    taker_item_id: SecureRandom.random_number(first_itemid...last_itemid),
    note: "i want this one",
  )
  bid.save!
end
# Use this for random get a user
# User.order(Arel.sql('RANDOM()')).first

#---------For Real seed and reset----------
Bid.destroy_all
Item.destroy_all

available = "available"

# ------------------------Test items------------------------
item = Item.new({ name: "登山背包", category: "体育",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "适合休闲人士登山的背包，非常轻便，装水和食物的空间都合适",
                  request: "none", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=4256958360,2636819116&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "电脑支架", category: "学习",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "在家隔离期间很懒吗？那就躺在床上使用这个支架吧！",
                  request: "给我一点好吃的", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=2282657352,655950086&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "电饭煲", category: "电器",
                  condition: "二手", image_url: "", value: 1, description: "这款电饭锅可是我去年在美国买的煮出来的饭非常非常香！",
                  request: "我想要一些好看的书", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img1.baidu.com/it/u=70086449,932049839&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "电磁炉", category: "电器",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "乡下买的电磁炉感觉不是很好用我想送人免费的你们要就拿去吧",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img1.baidu.com/it/u=1827791924,2284996746&fm=253&fmt=auto&app=120&f=JPEG?w=600&h=450"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "扫地机器人", category: "电器",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "在家懒得打扫建议使用这个超级懒人扫地机器人你就可以天天躺在床上了",
                  request: "我只想要一些零食", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=1900764361,3451186302&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=347"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "香奈儿包包", category: "时尚",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "我想用我的香奈儿包包换一个LV包包，你们有人有吗？",
                  request: "LV包包", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=3917141243,287314676&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=235"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "Gucci包包", category: "时尚",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "有人有香奈儿包包吗我想用我这个Gucci包包换！",
                  request: "香奈儿包包", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=3018592014,3373773813&fm=253&fmt=auto&app=120&f=PNG?w=750&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "男士CK钱包", category: "时尚",
                  condition: "二手", image_url: "", value: 1, description: "我前女友送我的钱包现在分手了我也不想要了你们谁要就拿去吧",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=1004134410,951357099&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "炒锅", category: "家具",
                  condition: "二手", image_url: "", value: 1, description: "这个炒股我家用了十几年了经验很丰富现在我家电视坏了想换一个电视机所以我想用我家的炒锅宝贝换一个全新的电视机",
                  request: "电视机要全新的", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img1.baidu.com/it/u=2517674439,3411429176&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "蚊帐", category: "家具",
                  condition: "二手", image_url: "", value: 1, description: "我家蚊子都被蟑螂吃掉了现在我不需要蚊帐我只想要一个杀蟑螂的药。。",
                  request: "灭蟑螂药", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=1021559130,1185233313&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "扫把", category: "家具",
                  condition: "二手", image_url: "", value: 1, description: "这个扫把我以前经常用来打男朋友现在我和男朋友分手了我也不想要这个扫把了就送给你们吧。",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img1.baidu.com/it/u=1091806379,215130169&fm=253&fmt=auto&app=138&f=PNG?w=604&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "加大高级拖把", category: "家具",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "这个拖把太重了我感觉不好用我想换一个轻便的扫把",
                  request: "扫把", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img1.baidu.com/it/u=554972364,2910169279&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "鼠标垫", category: "学习",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "这个鼠标垫打游戏很顺畅感觉，我想用我的鼠标垫换个鼠标。",
                  request: "鼠标", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=4108624280,1926245844&fm=253&fmt=auto&app=138&f=JPEG?w=432&h=286"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "进口滑板", category: "体育",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "隔离在家不能出去运动？那就试试这个滑板吧！进口的！",
                  request: "自行车", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=4208816974,731487539&fm=253&fmt=auto&app=138&f=PNG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "开瓶器", category: "家具",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "此开瓶器极其方便，我现在戒酒就不需要了，你们谁要隔离在家多喝点酒",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00228-1994.jpg"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "休闲乘凉椅子", category: "家具",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "休闲乘凉椅子在家坐一个下午感觉棒极了！我家沙发坏了想换一个新的沙发。",
                  request: "全新沙发", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00424-717.jpg"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "睫毛刷", category: "时尚",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "高等睫毛刷让你的眼睛漂漂亮亮！有女生用睫毛膏和我换吗？",
                  request: "睫毛膏", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=829818165,1994089928&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "瑜伽球", category: "体育",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "隔离在家最好的运动当然是做瑜伽了！",
                  request: "我只想要一些好吃的零食", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=1929795644,2968285171&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "kindle电子阅读器", category: "学习",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "kindle才是真正适合阅读学习的东西，你们那ipad都不能专心阅读玩游戏，我想用我的kindle换你们一个ipad",
                  request: "iPad", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img1.baidu.com/it/u=1609207697,2814693525&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "苹果14寸电脑包", category: "学习",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "我想用我这个电脑包换一个Macbook pro 14寸",
                  request: "macbook pro 14寸", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=1487726527,277177351&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "时尚行李箱", category: "时尚",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "隔离期间出去旅游就用我这款时尚行李箱！",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img1.baidu.com/it/u=4182279657,916808799&fm=253&fmt=auto&app=138&f=PNG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "舒适台灯", category: "学习",
                  condition: "二手", image_url: "", value: 1, description: "在家上网课用这款台灯很棒，免费的！",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=4178451386,1683788574&fm=253&fmt=auto&app=120&f=JPEG?w=350&h=350"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "洁厕灵", category: "家具",
                  condition: "二手", image_url: "", value: 1, description: "保证你家厕所香香的！我需要一个马桶刷",
                  request: "马桶刷", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=190917891,3693278024&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "苹果鼠标", category: "学习",
                  condition: "二手", image_url: "", value: 1, description: "这个苹果鼠标很老了大概十年了现在还能用我免费送人吧",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "http://t14.baidu.com/it/u=3215254233,3152151350&fm=224&app=112&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "加大瑜伽垫", category: "体育",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "这个瑜伽垫很大很大可以塞满你整个房间你运动空间要多大有多大！",
                  request: "瑜伽球", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=1494073237,215701048&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "洗澡拖鞋", category: "家具",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "免费赠送我穿了五年的高档洗澡拖鞋，放心我没有脚气",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img1.baidu.com/it/u=3419469251,912614876&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "颈肩按摩器", category: "电器",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "这个颈肩按摩器可以很好的治疗你的颈肩酸痛问题，我想要一个按摩椅",
                  request: "按摩椅", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=925829166,1792256674&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "特大号花盆", category: "家具",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "免费赠送特大号花盆有半个床那么大我家实在放不下了！",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=3828046426,4279253719&fm=253&fmt=auto&app=138&f=JPEG?w=523&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "时尚太阳镜", category: "时尚",
                  condition: ["全新", "二手"].sample, image_url: "", value: 1, description: "用这款时尚网红太阳镜可以在家自拍",
                  request: "一个小包包", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00475-857.jpg"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "东方基因抗原检测试剂", category: "家具",
                  condition: "全新", image_url: "", value: 1, description: "我这还有好多抗原检测试剂都送给你们了吧",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "http://t13.baidu.com/it/u=888154410,3601530766&fm=224&app=112&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "多芬沐浴露", category: "家具",
                  condition: "全新", image_url: "", value: 1, description: "前几个月买的多芬沐浴露洗澡洗香香！",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=3571093428,1752390163&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "六神洗发水", category: "家具",
                  condition: "全新", image_url: "", value: 1, description: "我这瓶全新的六神洗发水很好用的用了能快速长头发免费送给你们",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=3713673565,2884556815&fm=253&fmt=auto&app=138&f=JPEG?w=375&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "云南白药牙膏", category: "家具",
                  condition: "全新", image_url: "", value: 1, description: "我家里多了好多云南白药牙膏快过期了现在免费送人大家赶紧来拿",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img1.baidu.com/it/u=3551031663,2673586374&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "新华字典", category: "学习",
                  condition: "全新", image_url: "", value: 1, description: "新华字典第十版小学生必备，谁家有小学生免费拿去吧",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=1970176945,3285486087&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "书法练字帖", category: "学习",
                  condition: "全新", image_url: "", value: 1, description: "适合在家的小学生练字",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=3683961091,612100481&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "修正液", category: "学习",
                  condition: "全新", image_url: "", value: 1, description: "这里有免费的修正液送给你们家小学生用，千万不能吃！",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img1.baidu.com/it/u=2551156915,2048345235&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=460"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "高级铅笔", category: "学习",
                  condition: "全新", image_url: "", value: 1, description: "一只很高级的铅笔，想换一点零食吃",
                  request: "零食", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=418045642,2057477490&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "圆规", category: "学习",
                  condition: "二手", image_url: "", value: 1, description: "我家小孩小学毕业了不需要再用圆规了送给你们",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=756019860,1282088602&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "帐篷", category: "体育",
                  condition: "二手", image_url: "", value: 1, description: "在家搭帐篷也是不错的选择！",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=3734625118,443338001&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "雨伞", category: "家具",
                  condition: "二手", image_url: "", value: 1, description: "我都隔离在家这么多天没出门了外面下雨我也用不到这雨伞额就免费送给你们吧!",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=3898690736,2224728304&fm=253&fmt=auto&app=138&f=JPEG?w=607&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "象棋盘", category: "学习",
                  condition: "二手", image_url: "", value: 1, description: "你们有谁有围棋盘我想用我的象棋盘换",
                  request: "围棋盘", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=119575431,3053093181&fm=253&fmt=auto&app=138&f=JPEG?w=650&h=415"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "围棋盘", category: "学习",
                  condition: "二手", image_url: "", value: 1, description: "你们有谁有象棋盘我想用我的围棋盘换",
                  request: "围棋盘", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=187389844,398520790&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "按摩油", category: "家具",
                  condition: "全新", image_url: "", value: 1, description: "在家使用按摩油必备！",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=1902863691,1872144229&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "三阶魔方", category: "学习",
                  condition: "二手", image_url: "", value: 1, description: "我想用三阶魔方换一个四阶魔方",
                  request: "四阶魔方", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=2444522025,3862689891&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "四阶魔方", category: "学习",
                  condition: "二手", image_url: "", value: 1, description: "我想用四阶魔方换一个五阶魔方",
                  request: "五阶魔方", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=3949833378,441107778&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "五阶魔方", category: "学习",
                  condition: "二手", image_url: "", value: 1, description: "我想用五阶魔方换一个六阶魔方",
                  request: "六阶魔方", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=1051578091,2234999818&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "六阶魔方", category: "学习",
                  condition: "二手", image_url: "", value: 1, description: "我想用六阶魔方换一个七阶魔方",
                  request: "七阶魔方", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img2.baidu.com/it/u=1551667411,1592173733&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "七阶魔方", category: "学习",
                  condition: "二手", image_url: "", value: 1, description: "我想用七阶魔方换一个三阶魔方太难了",
                  request: "三阶魔方", is_freebie: false, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=3419142571,1248595326&fm=253&fmt=auto&app=138&f=JPG?w=500&h=438"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "羊毛衫", category: "时尚",
                  condition: "二手", image_url: "", value: 1, description: "穿了十年的羊毛衫不想要了免费送人",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img1.baidu.com/it/u=3058840872,1860929885&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "牛毛衫", category: "时尚",
                  condition: "二手", image_url: "", value: 1, description: "我上次买了个假货本来想买羊毛衫结果买成牛毛衫我实在穿不惯送给给你们吧",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00660-3556.jpg"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "猪毛衫", category: "时尚",
                  condition: "二手", image_url: "", value: 1, description: "我也不知道哪里买的猪毛衫反正穿不了你们有人要吗",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "http://t15.baidu.com/it/u=3366791433,1888527280&fm=224&app=112&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# ------------------------Test items------------------------
item = Item.new({ name: "花瓶", category: "家具",
                  condition: "二手", image_url: "", value: 1, description: "花瓶家里没地方放免费送人",
                  request: "", is_freebie: true, status: available, user: User.order(Arel.sql("RANDOM()")).first })
# item.image_url = Faker::LoremFlickr.image(search_terms: [item.name])
item.save
#upload image with active storage

# find the file
url = "https://img0.baidu.com/it/u=1722950454,622760796&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"
file = URI.open(url)
# attach it to item.photo

item.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
