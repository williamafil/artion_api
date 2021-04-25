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
    # id: 1,
    name: '油畫'
  },
  {
    name: '肖像'
  },
  {
    # id: 3
    name: '水彩'
  },
  {
    name: '塗鴉'
  },
  {
    # id: 5
    name: '雕塑'
  },
  {
    name: '攝影'
  },
  {
    # id: 7
    name: '古董'
  },
  {
    #id : 8,
    name: '抽象'
  }
])

User.destroy_all
User.create(
  name: '測試員',
  email: 'test@test.com',
  password: '123456',
)

jordan = User.create(
  # id: 2,
  name: '喬丹',
  email: 'jordan@jordan.com',
  password: '123456',
  is_artist: true
)
jordan.build_artist_info(name: '喬丹·卡斯蒂爾', email: 'jordan@contact.com', description: '備受矚目的千禧世代新銳藝術家 喬丹卡斯蒂爾（Jordan CASTEEL）風格鮮明而溫柔，她受到黑人男子氣概思想的啟發與薰陶，期待藉由畫筆改變黑人男性在社會中經常遇到的負面形象。以她最親近的人創作來源：家人、朋友、男朋友以及生活當中的不期而遇的人事物，都是藝術家筆下的最佳題材。這次展覽 “喬丹·卡斯蒂爾：回眸（Jordan CASTEEL: return the Gaze）” 共展出了 29件近五年的創作，畫作當中許多的主角是藝術家在紐約哈林區（Harlem），也就是她的成長環境，附近散步時遇到的人。作品中的人物都在凝視的瞬間而情境流動，不論是基於好奇心驅使或者情感回應，都吸引著觀眾頻頻注視與回眸。')
jordan.save
jordan.avatar.attach(
  io: File.open('./public/jordan_casteel/20191008_5d9c0c843db0f.jpeg'),
  filename: '20191008_5d9c0c843db0f.jpeg',
  content_type: 'application/jpeg'
)


ming = User.create(
  # id: 3,
  name: '朱銘',
  email: 'ming@ming.com',
  password: '123456',
  is_artist: true
)
ming.build_artist_info(name: '朱銘', email: 'ming@contact.com', description: '本名朱川泰，出生於日治臺灣新竹州苗栗郡通霄莊，台灣現代藝術雕塑家。15歲初從李金川師傅學習傳統廟宇的雕刻與繪畫，30歲拜入台灣雕塑界大師楊英風門下，朱銘融合傳統木雕與現代(moderne art)雕塑的精神，逐漸發展出超越兩者的獨特風格。1976年於國立歷史博物館舉辦首次個展，創作了〈同心協力〉等以台灣鄉土為題材且又富含生命力的木雕作品，當時正值台灣文化主體性的議題沸揚之時，因此受到了藝文界熱烈的迴響。其後，朱銘融合文化精神與太極招式的「太極系列」作品，更確立了朱銘在雕塑界的地位。以個體或群體為題材來表現人間百態的「人間系列」，則展現了高度的調和性，以及多元利用陶土、海綿、銅、不鏽鋼、保利龍等新媒材的嘗試與挑戰。')
ming.save
ming.avatar.attach(
  io: File.open('./public/ming_zhu/profile.jpeg'),
  filename: 'profile.jpeg',
  content_type: 'application/jpeg'
)

banksy_artist = User.create(
  # id: 4,
  name: 'Anonymous',
  email: 'banksy@banksy.com',
  password: '123456',
  is_artist: true
)
banksy_artist.build_artist_info(name: 'Banksy', email: 'banksy@contact.com', description: '你可能不知道 Banksy 是誰，但你絕對見過他的作品！塗鴉藝術在歐美來說，大多數的政府是視為「恣意毀壞他人財物罪」，而街頭塗鴉就是 Banksy 的武器，他以黑暗政治幽默與其獨特繪畫技巧相結合聞名，作品常帶有諷刺意味，來對政府提出異議、想替社會發聲。作為全球最神秘的藝術家，他常利用夜晚在大街上作畫，沒有人知道他的真面目，而且因為他的許多塗鴉作品是「違法」，不僅在街道巷弄間的畫作時常很快就被清洗掉，因此實際上沒有多少人看到過原作，更讓他成為了「被全世界通緝的藝術家」，但這卻也讓許多收藏家開始爭相在街道巷弄間找尋 Banksy 的蹤跡，而或許 Banksy 本尊也在人群當中，看著大家欣賞與討論他的畫作！')
banksy_artist.save
banksy_artist.avatar.attach(
  io: File.open('./public/banksy/15144452bijv.jpeg'),
  filename: '15144452bijv.jpeg',
  content_type: 'application/jpeg'
)


User.create(
  # id: 5,
  name: 'Ning Kang',
  email: 'nn@nn.com',
  password: '123456',
)
User.create( 
  # id: 6,
  name: '王國材',
  email: 'wang@wang.com',
  password: '123456',
)
User.create(
  # id: 7,
  name: '林佳龍',
  email: 'lin@lin.com',
  password: '123456',
)
User.create(
  # id: 8,
  name: '蔡英文',
  email: 'tsai@tsai.com',
  password: '123456',
)

# id: 9
apple = User.create(is_artist: true, name: '蘋果王', email: 'apple@apple.com', password: '123456')
apple.build_artist_info(name: '典藏蘋果', email: 'apple@contact.com', description: '古董蘋果愛好者')
apple.save
apple.avatar.attach(
  io: File.open('./public/macintosh/profile-1566083693404-83ff3f1a1c32image.jpeg'),
  filename: 'profile-1566083693404-83ff3f1a1c32image.jpeg',
  content_type: 'application/jpeg'
)

# id: 10
user = User.create(name: 'Will', password: '123456', email: 'will@will.com')
user.avatar.attach(
  io: File.open('./public/avatars/boy.png'),
  filename: 'boy.png',
  content_type: 'application/png'
)

# id: 11
user2 = User.create(is_artist: true, name: 'Dan', password: '123456', email: 'dan@dan.com')
user2.build_artist_info(name: 'Dan-Cristian', email: 'dan@contact.com', description: '"Dan-Cristian 為俄國抽象藝術家.三十歲時受莫內畫作的啟發.放棄在大學所研習的律師課程.毅然決定改行當畫家。其畫作啟發了抽象表現藝術風潮.為現代藝術開拓了不同視野.帶來全新的感受。康丁斯基一生畫風複雜多變.從早期很寫實的臨摹.到印象派、野獸派、表現主義.一直到後來的幾何學構成.到最後更發展出抒情抽象的神秘形式。這都在在顯示了他透過不斷的實驗.為了是去尋求一個藝術家內在邏輯的完美。')
user2.save
user2.avatar.attach(
  io: File.open('./public/dan-cristian/profile-1598024905394-dba9b60b0523image.jpeg'),
  filename: 'profile-1598024905394-dba9b60b0523image.jpeg',
  content_type: 'application/jpeg'
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

third_auction = Auction.create(
  title: 'Game Changer',
  description: '「遊戲改變者」是畫布上的原創作品，去年五月突然掛在南安普敦大學醫院的牆上。畫中描繪了一個玩超級英雄玩具的小男孩，扔掉了蝙蝠俠和蜘蛛俠，取而代之的是選擇穿著紅十字會制服的蒙面護士。畫作下方留下一張便條：「謝謝您所做的一切，希望這幅畫能使這個地方變亮一點，即使它只是黑色與白色的組合。」「遊戲改變者」代表新冠肺炎流行期間，醫護人員代替了蝙蝠俠和蜘蛛俠，成為孩子心中真正的超級英雄。關於這幅神秘醫院畫作的資料，此刻正在中正紀念堂班克斯大展「I LOVE BANKSY」中展出。',
  bidding_price: 80000000,
  interval: 5000000,
  start_time: 'April 23, 2021',
  end_time: 'May 5, 2021',
  is_active: true,
  user_id: 4,
  genre_id: 4
)

third_auction.images.attach(
  io: File.open('./public/banksy/photo.png'),
  filename: 'photo.png',
  content_type: 'application/png'
)
third_auction.images.attach(
  io: File.open('./public/banksy/photo2.jpg'),
  filename: 'photo2.jpg',
  content_type: 'application/jpeg'
)
third_auction.images.attach(
  io: File.open('./public/banksy/photo3.jpg'),
  filename: 'photo3.jpg',
  content_type: 'application/jpeg'
)
third_auction.images.attach(
  io: File.open('./public/banksy/11-2.png'),
  filename: '11-2.png',
  content_type: 'application/png'
)

fourth_auction = Auction.create(
  title: 'Macintosh Plus',
  description: 'Macintosh Plus計算機是Macintosh系列中的第三個型號，於1986年1月16日推出，比最初的Macintosh早兩年，比Macintosh 512K早一年多，售價為2599美元。作為對512K的改進，它附帶了1 MB的RAM標準（可擴展到4 MB）和外部SCSI外圍總線，其中包括一些較小的改進。',
  bidding_price: 100000,
  interval: 5000,
  start_time: 'May 1, 2021',
  end_time: 'May 8, 2021',
  is_active: true,
  user_id: 9,
  genre_id: 7
)

fourth_auction.images.attach(
  io: File.open('./public/macintosh/photo-1.jpeg'),
  filename: 'photo-1.jpeg',
  content_type: 'application/jpeg'
)
fourth_auction.images.attach(
  io: File.open('./public/macintosh/photo-2.jpeg'),
  filename: 'photo-2.jpeg',
  content_type: 'application/jpeg'
)
fourth_auction.images.attach(
  io: File.open('./public/macintosh/photo-3.jpeg'),
  filename: 'photo-3.jpeg',
  content_type: 'application/jpeg'
)
fourth_auction.images.attach(
  io: File.open('./public/macintosh/photo-4.jpeg'),
  filename: 'photo-4.jpeg',
  content_type: 'application/jpeg'
)
fourth_auction.images.attach(
  io: File.open('./public/macintosh/photo-5.jpeg'),
  filename: 'photo-5.jpeg',
  content_type: 'application/jpeg'
)

fifth_auction = Auction.create(
  title: 'Chaos',
  description: 'Chaos 是以直角、銳角、鈍角、直線、曲線等元素所構成.尤以「角」是此作的主角。在 Dan-Cristian 所著的「點線面」一書中提到「直角」表現一種冷靜、抑制的情感.「銳角」表現出一種尖銳的、運動感的特性.「鈍角」表現出一種軟弱的無力感。在此.康丁斯基讓各種角在畫面裡相互影響、彼此衝擊.是為了尋求一種靈活開放的構成表現。而包浩斯時期的圈圈在此畫作中也開始出現。',
  bidding_price: 10000,
  interval: 2000,
  start_time: 'May 12, 2021',
  end_time: 'May 20, 2021',
  is_active: true,
  user_id: 11,
  genre_id: 8
)
fifth_auction.images.attach(
  io: File.open('./public/dan-cristian/photo-1598112154392-8125edb6e71d.jpeg'),
  filename: 'photo-1598112154392-8125edb6e71d.jpeg',
  content_type: 'application/jpeg'
)

BidDetail.destroy_all
BidDetail.create([
  {
    user_id: 6,
    auction_id: 1,
    bid: 3100000
  },
  {
    user_id: 7,
    auction_id: 1,
    bid: 3200000
  },
  {
    user_id: 5,
    auction_id: 1,
    bid: 3600000
  },
  {
    user_id: 9,
    auction_id: 2,
    bid: 7500000
  },
  {
    user_id: 8,
    auction_id: 2,
    bid: 7800000
  },
  {
    user_id: 9,
    auction_id: 2,
    bid: 8500000
  },
])
