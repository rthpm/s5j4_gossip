require 'faker'

cities = []
users = []
ssbs = []
tags = []
tscs = []
pms = []
comms = []
ssb_like = 0
comms_like = 0

spacer = "\n" + '░' * 80 + "\n\n"

City.destroy_all
User.destroy_all
Scuttlebutt.destroy_all
Tag.destroy_all
TagsScuttlebutsConnection.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all
Like.destroy_all

10.times do
  city = City.create(name: Faker::Address.city,
                     zip_code: Faker::Address.zip_code)
  cities << city
end
tp cities
print spacer

10.times do
  user = User.create(first_name: Faker::Name.first_name,
                     last_name: Faker::Name.last_name,
                     email: Faker::Internet.email,
                     age: rand(18..98),
                     description: Faker::Lorem.paragraph,
                     city: City.all.sample)
  users << user
end
tp users
print spacer

15.times do
  ssb = Scuttlebutt.create(title: Faker::Book.title,
                           content: Faker::Lorem.paragraph,
                           user: User.all.sample)
  ssbs << ssb
end
tp ssbs
print spacer

10.times do
  tag = Tag.create(title: Faker::JapaneseMedia::Doraemon.gadget)
  tags << tag
end
tp tags
print spacer

ssbs.each do |ssb|
  tsc = TagsScuttlebutsConnection.create(tag_id: Tag.ids.sample,
                                         scuttlebutt: ssb)
  tscs << tsc
end
tp tscs
print spacer

40.times do
  sender = User.all.sample
  recipient = User.all.sample
  unless sender == recipient
    pm = PrivateMessage.create(content: Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
                               sender: User.all.sample,

                               recipient: User.all.sample)
  end
  pms << pm
end
tp pms
print spacer

20.times do
  comm = Comment.create(content: Faker::Lorem.paragraph,
                        scuttlebutt: Scuttlebutt.all.sample,
                        user: User.all.sample)
  comms << comm

  subcomm = Comment.create(content: Faker::Lorem.paragraph,
                           subcomment: Comment.all.sample,
                           user: User.all.sample)
  comms << subcomm
end
tp comms
print spacer

20.times do
  if rand(1..2) == 1
    Like.create(user: User.all.sample,
                scuttlebutt: Scuttlebutt.all.sample)
    ssb_like += 1
  else
    Like.create(user: User.all.sample,
                comment: Comment.all.sample)
    comms_like += 1
  end
end
print("#{ssb_like} gossips et #{comms_like} commentaires likés\n#{spacer}")
