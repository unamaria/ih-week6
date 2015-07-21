Rails.application.routes.draw do

	get ('matches/:faction') => 'matches#index_by_faction'
	get ('matches/winner/:player_id') => 'matches#index'  

end
