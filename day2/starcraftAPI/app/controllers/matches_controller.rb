class MatchesController < ApplicationController
	def index
		matches = Match.joins(:players).where(winner_id: params[:player_id])
		render json: matches
	end
end