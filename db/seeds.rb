
require 'faker'

10.times do
  User.create!(
    :email    => Faker::Internet.email,
    :password     => Faker::Internet.password
  )
end

users = User.all

puts "#{User.count} users created"

10.times do
wiki = Wiki.create!(
   user:         users.sample,
  :title        => Faker::Job.title,
  :body         => Faker::Job.position,
  private:      false
)
end



puts "#{Wiki.count} wikis created"
puts "Seed finished"