# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

factions = ['terrans', 'zerg', 'protoss']
players = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]

15.times do |j|
	Player.create(name: "player #{j}")
	5.times do
		Match.create(
			winner_faction: factions.sample, 
			loser_faction: factions.sample, 
			duration: 1.5, 
			date: Date.current,
			winner_id: players.sample,
			loser_id: players.sample 
			)
	end
end
