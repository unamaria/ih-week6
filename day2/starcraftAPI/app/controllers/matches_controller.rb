class MatchesController < ApplicationController
	def index
		matches = Match.joins(:winner).where(winner_id: params[:player_id])
		render json: matches
	end
end