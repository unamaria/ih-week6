Rails.application.routes.draw do

	get ('matches/:player_id') => 'matches#index'  

end
