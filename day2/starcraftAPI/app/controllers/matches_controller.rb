class MatchesController < ApplicationController
	def index
		matches = Match.where(winner_id: params[:player_id])
		render json: matches
	end
end