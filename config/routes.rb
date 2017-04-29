Rails.application.routes.draw do
	resources :wells do
		resources :depth_data
		resources :descriptions
		resources :lithologies
		resources :mineralogies
		resources :well_symbols
	end
end
