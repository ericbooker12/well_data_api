class Well < ApplicationRecord
	has_many :depth_data, dependent: :destroy
	has_many :descriptions, dependent: :destroy
	has_many :lithologies, dependent: :destroy
	has_many :mineralogies, dependent: :destroy
	has_many :well_symbols, dependent: :destroy
end
