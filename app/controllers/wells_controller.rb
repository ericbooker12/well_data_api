class WellsController < ApplicationController
	before_action :set_well, only: [:show, :update, :destroy]

	def index
		@wells = Well.all
		json_response(@wells)
	end

	def well_names
		p "*" * 30
		@well_num = params['well_num']
		p "*" * 30
		@wells = Well.all
		@well_names = []
		# wells.each do |well_name|
		# 	@well_names.push(well_name.name)
		# end
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

# custom methods

	def show_well
		@well_num = params['well_num']
		@well = Well.find_by( well_number: @well_num )
		if @well
			json_response(@well)
		end
	end

	private

		def well_params
			params.permit(:name, :start_date, :end_date, :total_depth, :well_number)
		end

		def set_well
			@well = Well.find(params[:id])
		end

end
