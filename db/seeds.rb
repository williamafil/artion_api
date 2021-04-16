# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
users = User.create([
  { 
    name: '測試員',
    email: 'test@test.com',
    password: '123456',
  }, 
  { 
    name: '路人甲',
    email: 'user@user.com',
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