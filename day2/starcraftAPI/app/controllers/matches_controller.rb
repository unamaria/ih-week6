class MatchesController < ApplicationController
	def index
		matches = Match.where(winner_id: params[:player_id])
		render json: matches
	end

	def index_by_faction
		faction = params[:faction].downcase
		matches = Match.where(["winner_faction = ? OR loser_faction = ?", faction, faction]).all
		total = matches.length
		won = Match.where(winner_faction: faction).count
		render json: { win_percentage: (won.to_f/total.to_f * 100).round(2), matches: matches }
	end
end