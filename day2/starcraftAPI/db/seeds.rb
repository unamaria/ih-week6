# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

factions = ['Terrans', 'Zerg', 'Protoss']

10.times do |i|
	Match.create(winner_faction: factions.sample, loser_faction: factions.sample, duration: 1.5, date: Date.current)
end