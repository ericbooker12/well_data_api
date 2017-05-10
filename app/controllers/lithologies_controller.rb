class LithologiesController < ApplicationController
	before_action :set_lith, only: [:show, :update, :destroy]

	def index
		@lithologies = Lithology.all
		json_response(@lithologies)
	end

	def create
		@lithology = Lithology.create!(lithology_params)
		json_response(@lithology, :created)
	end

	def show

		json_response(@lithology)
	end

	def update
		@lithology.update(lithology_params)
		head :no_content
	end

	def destroy
		@lithology.destroy
		head :no_content
	end

	def get_lith
		well_num = params['well_num']
		@lith = Lithology.find_by( well_number: well_num )
		if @lith
			json_response(@lithology)
		end
	end

	private

		def lithology_params
			params.permit(
				:depth,
				:felsite,
				:blueschist,
				:greenstone,
				:chert,
				:peridotite,
				:mum,
				:silicic_graywacke,
				:lithic_graywacke,
				:argillite,
				:serpentine,
				:clay,
				:blank
			)
		end

		def set_lith
			@lith = Lithology.find(params[:id])
		end

end
