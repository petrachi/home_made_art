# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create name: 'Thomas', email: 'thomas@hma.fr', password: 'youpi'
u = User.create name: 'Adrien', email: 'folie.adrien@gmail.com', password: 'pute'

Tag.create title: 'video games'
Tag.create title: 'forest'
Tag.create title: 'knife painting'

Article.create user: u,
  title: "My first article",
  brief: "Cessupaire",
  content: "Je suis tres fier de mon premier article",
  published: true,
  published_at: Time.now
