class Match < ActiveRecord::Base
	belongs_to :winner, class_name: 'Player'
	belongs_to :loser, class_name: 'Player'

	def self.index_by_faction(faction)
		faction = faction.downcase
		matches = Match.where(["winner_faction = ? OR loser_faction = ?", faction, faction]).all
		total = matches.length
		won = Match.where(winner_faction: faction).count	
		win_percentage = percentage(won, total)
		return matches, win_percentage
	end

	def self.index_by_player(player_id)
		matches = Match.where(["winner_id = ? OR loser_id = ?", player_id, player_id]).all
		wins = matches.inject(0) do |total_wins, match|
			if match.winner_id == player_id.to_i
				total_wins + 1
			else
				total_wins
			end
		end	
		total = matches.length
		losses = total - wins
		loss_percentage = percentage(losses, total) 
		win_percentage = 100 - loss_percentage 
		return matches, win_percentage, loss_percentage
	end

	private

	def self.percentage(partial, total)
		(partial.to_f / total.to_f * 100).round(2)
	end
end