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

file = URI.open("https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png")
article = Article.new(title: "NES", body: "A great console")
article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
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

100.times do
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
