class Well < ApplicationRecord
	has_many :depth_data, :descriptions, :lithologies, :mineralogies, :well_symbols
end
