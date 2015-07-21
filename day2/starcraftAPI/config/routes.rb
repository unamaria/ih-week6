Rails.application.routes.draw do

	get ('matches/:faction') => 'matches#indexByFaction'
	get ('matches/winner/:player_id') => 'matches#index'  

end
