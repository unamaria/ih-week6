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

	def by_player
		matches, win_percentage, loss_percentage = Match.index_by_player(params[:player_id])
		render json: { win_percentage: win_percentage, loss_percentage: loss_percentage, matches: matches }
	end
end