Rails.application.routes.draw do

	get '/wells/well_data', to: 'wells#show_well'
	get '/wells/max_depth', to: 'wells#get_well_max_depth'
	get '/wells/well_names', to: 'wells#well_names'

	resources :wells do
		resources :depth_data
		resources :descriptions
		resources :lithologies
		resources :mineralogies
		resources :well_symbols
		resources :summary_descriptions
	end
end
