Rails.application.routes.draw do

	get ('matches/winner/:player_id') => 'matches#index'  
	get ('matches/:faction') => 'matches#by_faction'

end
