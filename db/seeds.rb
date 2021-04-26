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
jordan.build_artist_info(
  name: '喬丹·卡斯蒂爾',
  email: 'jordan@contact.com',
  description: '
                喬丹·卡斯蒂爾（Jordan Casteel）（生於1989年）是一位美國具像畫家。卡斯蒂爾的風格鮮明而溫柔，她受到黑人男子氣概思想的啟發與薰陶，期待藉由畫筆改變黑人男性在社會中經常遇到的負面形象。以她最親近的人創作來源：家人、朋友、男朋友以及生活當中的不期而遇的人事物，都是藝術家筆下的最佳題材。
                <br/><br/><br/>
                <h3>早期生活和教育</h3>
                Casteel於1989年出生於美國科羅拉多州的丹佛市，來自Lauren Young Casteel和Charles Casteel。 Casteel有一個孿生兄弟和一個哥哥。她以弗農·E·喬丹（Vernon E. Jordan Jr.）的名字命名，後者是祖父惠特尼·楊（Whitney Young）繼任國家城市聯盟（National Urban League）的負責人，並且是親密的家人。她的祖母是瑪格麗特·巴克納·楊（Margaret Buckner Young），她是教育家和兒童讀物的作者。
                <br/><br/>
                卡斯蒂爾就讀於藝術的拉馬爾·多德在學校喬治亞大學在科爾托納，意大利在2010年畢業於阿格尼斯斯科特學院在迪凱特，格魯吉亞在2011年以後卡斯蒂爾繼續接受她的師父在美術繪畫和版畫在耶魯大學在2014年。卡斯蒂爾參加了若干組展而在耶魯，包括13藝術家，歷史性的節目由當時的同學策劃達沃爾Erizku。
                <br/><br/><br/>
                <h3>主題和風格</h3>
                卡斯蒂爾（Casteel）的作法探索人性，性，身份和主觀性。卡斯蒂爾（Casteel）幾乎只將黑色的對象塗上油漆，通常根據她為保姆拍攝的照片圍繞保姆周圍的光線使用不同的膚色。主體被塗成各種深淺的棕色，灰色，檸檬綠，海軍藍和淺橙色。
                <br/><br/>
                卡斯蒂爾的繪畫方法和對色彩的大膽使用已與畫家雅各布·勞倫斯（Jacob Lawrence），南希·斯佩羅（Nancy Spero）和亨利·馬蒂斯（Henri Matisse）進行了比較。[10] Casteel在她的作品中開發的調色板都是基於對童年時期建立的對色彩和鮮豔度的迷戀關係，並決心突破解釋的界限。她嘗試了自己的色彩對她所畫的環境及其與被攝對象的關係的影響。在整個作品集中，觀看者可以觀察到豐富的色彩，這些色彩代表著她所拍攝對象的膚色。卡斯特爾在繪畫中擺出的姿勢和目光與她與色彩的關係一樣不可或缺，因為她一直在努力推動黑色的對話。[28]卡斯特爾的具像作品也已與紐約藝術家愛麗絲·尼爾（Alice Neel）進行了比較。
                <br/><br/>
                卡斯蒂爾的作品來自她自己拍攝的主題照片。糾纏在主題及其周圍環境中的更深層含義和目標。考慮到今天在美國成為黑人的含義，她旨在推動觀眾的思想。約旦在紐約國際藝術雜誌的採訪中說，“這些畫作的目的是揭示我對黑人作為姐妹，女兒，朋友和情人的看法。紐約國際藝術工作室在紐約出版的藝術期刊，每月有20万讀者。這種觀點充滿了同情和愛心。我看到了他們的人性，並希望觀眾以他們的父親，兒子，兄弟，堂兄與他們互動-作為具有各自獨特故事的個人來分享。” 

')
jordan.save
jordan.avatar.attach(
  io: File.open('./public/jordan_casteel/20191008_5d9c0c843db0f.jpeg'),
  filename: '20191008_5d9c0c843db0f.jpeg',
  content_type: 'application/jpeg'
)
jordan.artist_info.arts.attach(
  io: File.open('./public/jordan_casteel/within_reach.jpeg'),
  filename: 'Within Reach',
  content_type: 'application/jpeg'
)
jordan.artist_info.arts.attach(
  io: File.open('./public/jordan_casteel/FEAT-Jordan-Casteel-Self-Portrait-2012.png'),
  filename: 'Self-Portrait',
  content_type: 'application/png'
)
jordan.artist_info.arts.attach(
  io: File.open('./public/jordan_casteel/JORDAN-CASTEEL-Mom-2013.png'),
  filename: 'Mom',
  content_type: 'application/png'
)
jordan.artist_info.arts.attach(
  io: File.open('./public/jordan_casteel/786a3cd08330401bca59f190f71372bd.jpeg'),
  filename: 'The Power of the Lean',
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
banksy_artist.build_artist_info(
  name: 'Banksy',
  email: 'banksy@contact.com',
  description: 'Banksy，是一位匿名的英國塗鴉藝術家、社會運動活躍份子、電影導演及畫家。也有人猜測瑞士藝術家大師鏡（Maître de Casson）可能是班克西。瑪麗·德·卡森（Maître de Casson）在他的網站上否認了這一點。
                <br/><br/>
                他的街頭作品經常帶有諷刺意味，在旁則附有一些顛覆性、玩世不恭的黑色幽默和精警句子；其塗鴉大多運用獨特的模板技術拓印而成。他的作品富有濃厚政治風格，儼如一種以藝術方式表達的社會評論，並已經在世界各地不同城市的街道、牆壁與橋樑出現，甚至成為當地引人入勝的城市面貌。
                <br/><br/>
                班克斯的創作生涯源於早年參與布里斯托地下圈子，當中包括了不少藝術家與音樂人的跨界別合作。根據作家和圖像設計師卓斯坦·文高（Tristan Manco）所說，Banksy是出生於1974年並在英國西南部布里斯托市成長的；另外文高又透露他是一名影印機技術員之子，最初是要學習當個肉店屠夫的，後來卻備受1980年代後期在該城興起的塗鴉熱潮影響而深陷其中。有文化評論員指出，班克斯的繪圖風格跟查維亞·普魯（外號「Blek le Rat」）相近，後者從1981年便已經在巴黎開始從事模板印刷的藝術工作，組過龐克樂隊，時至今日仍然活躍於倫敦的塗鴉藝術界。
                <br/><br/>
                眾所周知，對於絕大多數政府將塗鴉藝術標籤為「恣意毀壞他人財物罪」之既定政策，Banksy一向以藐視的立場聞名。他習慣在最能接觸社會大眾的表面，例如牆壁等地方展示自己的作品，有時更加不惜親自動手，為其塗鴉圖案建造些物理支撐點。儘管班克斯從來不曾把自己的塗鴉作品或相關照片用作銷售牟利的用途，不過，很多藝術拍賣行都曾經試圖出售他進行街頭藝術的現場，並讓贏出競價的人自行決定對該處塗鴉的處置方式。'
)

banksy_artist.save
banksy_artist.avatar.attach(
  io: File.open('./public/banksy/avatar.jpeg'),
  filename: 'avatar.jpeg',
  content_type: 'application/jpeg'
)
banksy_artist.artist_info.arts.attach(
  io: File.open('./public/banksy/Season’s  Greetings_1.jpeg'),
  filename: 'Season’s Greetings',
  content_type: 'application/jpeg'
)
banksy_artist.artist_info.arts.attach(
  io: File.open('./public/banksy/Season’s  Greetings_2.jpeg'),
  filename: 'Season’s Greetings',
  content_type: 'application/jpeg'
)
banksy_artist.artist_info.arts.attach(
  io: File.open('./public/banksy/balloon-girl.jpeg'),
  filename: 'Balloon Girl',
  content_type: 'application/jpeg'
)
banksy_artist.artist_info.arts.attach(
  io: File.open('./public/banksy/graffiti_is_a_crime.jpeg'),
  filename: 'Graffiti Is A Crime',
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
  bidding_price: 300000,
  interval: 1000,
  start_time: 'April 18, 2021',
  end_time: 'April 23, 2021',
  is_active: true,
  user_id: 2,
  genre_id: 4
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
  bidding_price: 680000,
  interval: 30000,
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
  bidding_price: 800000,
  interval: 5000,
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
  bidding_price: 200000,
  interval: 5000,
  start_time: 'May 1, 2021',
  end_time: 'May 8, 2021',
  is_active: true,
  user_id: 9,
  genre_id: 5
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
  genre_id: 3
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


Like.destroy_all
Like.create([
  {user_id: 1, auction_id:1},
  {user_id: 1, auction_id:3},
  {user_id: 3, auction_id:1},
  {user_id: 3, auction_id:2},
  {user_id: 3, auction_id:4},
  {user_id: 2, auction_id:2}
])