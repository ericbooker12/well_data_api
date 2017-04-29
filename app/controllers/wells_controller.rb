class WellsController < ApplicationController
	before_action :set_well, only: [:show]

	def index
		@wells = Well.all
		json_response(@wells)
	end

	def show
		json_response(@well)
	end

	private

		def well_params
			params.permit(:name, :start_date, :end_date, :total_depth, :well_number)
		end

		def set_well
			@well = Well.find(params[:id])
		end

end
