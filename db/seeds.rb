# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.destroy_all
Genre.create([
  {
    name: '油畫'
  },
  {
    name: '肖像'
  },
  {
    name: '水彩'
  },
  {
    name: '塗鴉'
  },
  {
    name: '雕塑'
  },
  {
    name: '攝影'
  }
])

User.destroy_all
User.create([
  { 
    name: '測試員',
    email: 'test@test.com',
    password: '123456',
  }, 
  { 
    name: '喬丹·卡斯蒂爾',
    email: 'jordan@jordan.com',
    password: '123456',
  },
  { 
    name: 'Ning',
    email: 'nn@nn.com',
    password: '123456',
  },
])

user = User.create(name: 'Will', password: '123456', email: 'will@will.com')
user.avatar.attach(
  io: File.open('./public/avatars/boy.png'),
  filename: 'boy.png',
  content_type: 'application/png'
)

Auction.destroy_all
first_auction = Auction.create(
  title: 'Jiréh 以勒',
  description: '備受矚目的千禧世代藝術家 喬丹卡斯蒂爾風格鮮明而溫柔，她受到黑人男子氣概思想的啟發與薰陶，期待藉由畫筆改變黑人男性在社會中經常遇到的負面形象。以她最親近的人創作來源：家人、朋友、男朋友以及生活當中的不期而遇的人事物，都是藝術家筆下的最佳題材。這次展覽 “喬丹·卡斯蒂爾：回眸（Jordan CASTEEL: return the Gaze）” 共展出了 29件近五年的創作，畫作當中許多的主角是藝術家在紐約哈林區（Harlem），也就是她的成長環境，附近散步時遇到的人。作品中的人物都在凝視的瞬間而情境流動，不論是基於好奇心驅使或者情感回應，都吸引著觀眾頻頻注視與回眸。',
  bidding_price: 3000000,
  interval: 100000,
  start_time: 'April 18, 2021',
  end_time: 'April 23, 2021',
  is_active: true,
  user_id: 2,
  genre_id: 1
)
first_auction.images.attach(
  io: File.open('./public/jordan_casteel/jordan-casteel-jireh.jpeg'),
  filename: 'jordan-casteel-jireh.jpeg',
  content_type: 'application/jpeg'
)
first_auction.images.attach(
  io: File.open('./public/jordan_casteel/jordan-casteel-jireh-2.jpeg'),
  filename: 'jordan-casteel-jireh-2.jpeg',
  content_type: 'application/jpeg'
)
first_auction.images.attach(
  io: File.open('./public/jordan_casteel/jordan-casteel-jireh-3.jpeg'),
  filename: 'jordan-casteel-jireh-3.jpeg',
  content_type: 'application/jpeg'
)

second_auction = Auction.create(
  title: '單鞭下勢',
  description: '單鞭下勢為「太極」系列之一。以樟木為材，順著木材紋理的大刀闊斧之作-「單鞭下勢」，其動勢逼人；快刀中，不只強調了木質的生命，並且透露出精練的身體律動感，充分予人一股連綿不絕之氣。 ',
  bidding_price: 6800000,
  interval: 300000,
  start_time: 'April 19, 2021',
  end_time: 'April 27, 2021',
  is_active: true,
  user_id: 3,
  genre_id: 5
)

second_auction.images.attach(
  io: File.open('./public/ming_zhu/ming_0.jpg'),
  filename: 'ming_0.jpg',
  content_type: 'application/jpeg'
)
second_auction.images.attach(
  io: File.open('./public/ming_zhu/ming_1.jpg'),
  filename: 'ming_1.jpg',
  content_type: 'application/jpeg'
)
second_auction.images.attach(
  io: File.open('./public/ming_zhu/ming_2.jpg'),
  filename: 'ming_2.jpg',
  content_type: 'application/jpeg'
)
second_auction.images.attach(
  io: File.open('./public/ming_zhu/ming_3.jpg'),
  filename: 'ming_3.jpg',
  content_type: 'application/jpeg'
)
