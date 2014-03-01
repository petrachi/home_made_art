# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create name: 'Thomas', email: 'thomas@hma.fr', password: 'youpi'

c = Category.create name: 'Wood Stuff'

Product.create user: u, category: c,
  name: 'Painting',
  brief: 'It\'s a painting',
  descr: %q{
    A beatifull painting,
    Of a milf, half naked.
  },
  price: 450,
  stock: 1,
  public: true,
  published: true

Product.create user: u, category: c,
  name: 'Crafting',
  brief: 'A piece of craft',
  descr: %q{
    I am crafting all day,
    I want some money out of that.
  },
  price: 60,
  stock: 100,
  public: true,
  published: true
