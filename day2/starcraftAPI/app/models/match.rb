class Match < ActiveRecord::Base
	belongs_to :winner, class_name: 'Player'
	belongs_to :loser, class_name: 'Player'

	def self.index_by_faction(faction)
		faction = faction.downcase
		matches = Match.where(["winner_faction = ? OR loser_faction = ?", faction, faction]).all
		total = matches.length
		won = Match.where(winner_faction: faction).count	
		win_percentage = (won.to_f/total.to_f * 100).round(2)
		return matches, win_percentage
	end
end