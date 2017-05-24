class SummaryDescriptionsController < ApplicationController
	before_action :set_description, only: [:show, :update, :destroy]

	def index
		@summary_descriptions = SummaryDescription.all
		json_response(@summary_descriptions)
	end

	def create
		@summary_descriptions = SummaryDescription.create!(summary_description_params)
		json_response(@summary_descriptions, :created)
	end

	def show

		json_response(@summary_descriptions)
	end

	def update
		@summary_descriptions.update(summary_description_params)
		head :no_content
	end

	def destroy
		@summary_descriptions.destroy
		head :no_content
	end

	def get_description
		well_num = params['well_num']
		@description = SummaryDescription.find_by( well_number: well_num )
		if @description
			json_response(@summary_descriptions)
		end
	end

	private

		def summary_description_params
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

		def set_description
			@description = SummaryDescription.find(params[:id])
		end


end
