Rails.application.routes.draw do

	get '/wells/well_data', to: 'wells#show_well'

	resources :wells do
		resources :depth_data
		resources :descriptions
		resources :lithologies
		resources :mineralogies
		resources :well_symbols
	end
end
