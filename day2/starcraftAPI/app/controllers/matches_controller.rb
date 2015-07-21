class MatchesController < ApplicationController
	def index
		matches = Match.where(winner_id: params[:player_id])
		render json: matches
	end

	def by_faction
		# raise object.inspect
		matches, win_percentage = Match.index_by_faction(params[:faction])
		render json: { win_percentage: win_percentage, matches: matches }
	end
end