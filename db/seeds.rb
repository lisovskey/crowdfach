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
user.validated = true
user.skip_confirmation!
user.save

category_names = [:art, :games, :music, :people, :tech, :video]
category_names.each do |category_name|
  Category.create name: category_name
end

project = Project.new
project.name = 'Bitcoin Cash'
project.description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
project.full_description = <<-END.strip_heredoc
  ## Lorem ipsum\r
  #### Lorem ipsum dolor sit amet\r
  ```\r
  Ut enim ad minim veniam,\r
    quis nostrud exercitation\r
    ullamco laboris nisi\r
    ut aliquip ex ea commodo consequat.\r
  ```\r
  \r
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r
  \r
   - first\r
   - second\r
   - third\r
END
project.target = 5.12
project.balance = 1.28
project.category_id = 1
project.expiration_time = "2020-01-01 00:00:00"
project.user_id = user.id
project.save
