# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |i|
	user = User.create(name: "name #{i}", email: "m#{i}@patum.com")
	3.times do |j|
		Task.create(name: "task #{j} from user #{user.id}", completion: nil, user_id: user.id)
	end
end