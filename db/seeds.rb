# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new
user.email = 'user@google.com'
user.password = 'motherfucker'
user.first_name = 'Max'
user.last_name = 'Titovich'
user.role = 'admin'
user.skip_confirmation!
user.save
