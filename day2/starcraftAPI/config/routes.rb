Rails.application.routes.draw do

	get ('matches/:faction') => 'matches#by_faction'
	get ('matches/players/:player_id') => 'matches#by_player'
	get ('matches/players/winner/:player_id') => 'matches#index'  

end
