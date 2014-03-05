# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name(role)
  puts 'role: ' << role
end

puts 'ADMIN USER'
# create the Identity
i = Identity.where(name: ENV['ADMIN_NAME'], email: ENV['ADMIN_EMAIL']).first_or_initialize
i.password = ENV['ADMIN_PASSWORD']
i.password_confirmation = i.password
i.save
# create the User
u = User.where(uid: i.uid, provider: 'identity').first_or_initialize
u.name = i.name
u.email = i.email
u.save
# assign the Admin role
u.add_role :admin

Category.find_or_create_by_name(ENV['FIRST_CATEGORY'])