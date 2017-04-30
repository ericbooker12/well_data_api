class WellsController < ApplicationController
	before_action :set_well, only: [:show, :update, :destroy]

	def index
		@wells = Well.all
		json_response(@wells)
	end

	def create
		@well = Well.create!(well_params)
		json_response(@well, :created)
	end

	def show
		json_response(@well)
	end

	def update
		@well.update(well_params)
		head :no_content
	end

	def destroy
		@well.destroy
		head :no_content
	end

	private

		def well_params
			params.permit(:name, :start_date, :end_date, :total_depth, :well_number)
		end

		def set_well
			@well = Well.find(params[:id])
		end

end
