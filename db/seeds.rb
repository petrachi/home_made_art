# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create name: 'Thomas', email: 'thomas@hma.fr', password: 'youpi'

Product.create user: u, name: 'Painting', price: 450
Product.create user: u, name: 'Drawing', price: 15
Product.create user: u, name: 'Crafting', price: 60




=begin

next to do :
- setup r_kit
- create / edit product forms

=end
