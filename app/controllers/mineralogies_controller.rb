class MineralogiesController < ApplicationController
		before_action :set_min, only: [:show, :update, :destroy]

	def index
		@mineralogies = Mineralogy.all
		p @mineralogies
		json_response(@mineralogies)
	end

	def create
		@mineralogies = Mineralogy.create!(mineralogy_params)
		json_response(@mineralogies, :created)
	end

	def show

		json_response(@mineralogies)
	end

	def update
		@mineralogies.update(mineralogy_params)
		head :no_content
	end

	def destroy
		@mineralogies.destroy
		head :no_content
	end

	def get_min
		well_num = params['well_num']
		@min = Mineralogy.find_by( well_number: well_num )
		if @min
			json_response(@mineralogies)
		end
	end

	private

		def mineralogy_params
			params.permit(
				:quartz,
				:calcite,
				:pyrite,
				:pyrrhotite,
				:chlorite,
				:axinite,
				:actinolite,
				:tourmaline,
			)
		end

		def set_min
			@min = Mineralogy.find(params[:id])
		end

end
