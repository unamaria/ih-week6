class MatchesController < ApplicationController
	def index
		matches = Match.where(winner_id: params[:player_id])
		render json: matches
	end

	def indexByFaction
		matches = Match.where(["winner_faction = ? OR loser_faction = ?", params[:faction], params[:faction]])
		total = Match.where(["winner_faction = ? OR loser_faction = ?", params[:faction], params[:faction]]).count
		won = Match.where(winner_faction: params[:faction]).count
		render json: { win_percentage: (won.to_f/total.to_f * 100).round(2), matches: matches }
	end
end