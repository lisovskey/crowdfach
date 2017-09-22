# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Rails.env.production?
  require 'database_cleaner'
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
end

user = User.new
user.email = 'user@google.com'
user.password = 'motherfucker'
user.first_name = 'Chester'
user.last_name = 'Bennington'
user.admin = true
user.wallet = '1EYv3SijVkoKYx2d6kzgtRsqK5G2o5Jq4D'
File.open('public/uploads/user/avatar/1/vb.jpg') do |f|
  user.avatar = f
end
user.skip_confirmation!
user.save

user = User.new
user.email = 'user@apple.com'
user.password = 'motherfucker'
user.first_name = 'Max'
user.last_name = 'Titovich'
user.validated = true
user.wallet = '1EYv3SijVkoKYx2d6kzgtRsqK5G2o5Jq4D'
File.open('public/uploads/user/avatar/2/vabo.png') do |f|
  user.avatar = f
end
user.skip_confirmation!
user.save

category_names = [:art, :games, :music, :people, :tech, :video]
category_names.each do |category_name|
  Category.create name: category_name
end

description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
full_description = <<-END.strip_heredoc
## Lorem ipsum\r
#### Lorem ipsum dolor sit amet\r
```\r
Ut enim ad minim veniam,\r
  quis nostrud exercitation\r
  ullamco laboris nisi\r
  ut aliquip ex ea commodo consequat.\r
```\r
\r
Lorem ipsum dolor sit amet, consectetur **adipiscing** elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud **exercitation** ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\r
\r
#### Lorem Lorem Lorem\r
 - first dolor\r
 - second dolor\r
 - third dolor\r
 - fourth dolor\r
\r
Excepteur sint occaecat cupidatat non proident, sunt in *culpa qui officia* deserunt mollit anim id est laborum.\r
##### laborum laborum laborum\r
###### deserunt deserunt
END

project = Project.new
project.name = 'Bitcoin Cash'
project.description = description
project.full_description = full_description
project.target = 5.12
project.balance = 3.68
project.category_id = 1
File.open('public/uploads/project/avatar/1/vaultboy.jpg') do |f|
  project.avatar = f
end
project.expiration_time = Time.zone.now + 10 * 60 * 60 * 24
project.user_id = 1
project.save

project = Project.new
project.name = 'Etherium Classic'
project.description = description
project.full_description = full_description
project.target = 3.84
project.balance = 0.68
project.category_id = 2
File.open('public/uploads/project/avatar/2/boy.png') do |f|
  project.avatar = f
end
project.expiration_time = Time.zone.now + 10 * 60
project.user_id = 1
project.save

project = Project.new
project.name = 'Litecoin Cash'
project.description = description
project.full_description = full_description
project.target = 4.44
project.balance = 7.93
project.category_id = 3
File.open('public/uploads/project/avatar/3/vault.jpg') do |f|
  project.avatar = f
end
project.expiration_time = Time.zone.now + 10
project.user_id = 2
project.save
