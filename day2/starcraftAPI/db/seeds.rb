# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

Player.destroy_all
Match.destroy_all

factions = ['Terrans', 'Zerg', 'Protoss']

15.times do |j|
	player = Player.create(name: "player #{j}")
	5.times do
		Match.create(
			winner_faction: factions.sample, 
			loser_faction: factions.sample, 
			duration: 1.5, 
			date: Date.current,
			winner_id: player.id,
			loser_id: (player.id + 1) 
			)
	end
end

Match.last.destroy
