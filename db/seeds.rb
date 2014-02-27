# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create name: 'Thomas', email: 'thomas@hma.fr', password: 'youpi'

Product.create user: u, title: 'Painting', price: 450
Product.create user: u, title: 'Drawing', price: 15
Product.create user: u, title: 'Crafting', price: 60
