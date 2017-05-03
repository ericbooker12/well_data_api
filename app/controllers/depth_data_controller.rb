class DepthDataController < ApplicationController
	before_action :set_depth_data, only: [:show, :update, :destroy]

	def index
		@depth_data = DepthDatum.all
		json_response(@depth_data)
	end

	def create
		@depth_datum = DepthDatum.create!(depth_datum_params)
		json_response(@depth_datum, :created)
	end

	def show
		json_response(@depth_datum)
	end

	def update
		@depth_datum.update(depth_datum_params)
		head :no_content
	end

	def destroy
		@depth_datum.destroy
		head :no_content
	end

	private

		def depth_datum_params
			params.permit(:depth, :rop, :wob, :temp_in, :temp_out, :pressure)
		end

		def set_depth_data
			@depth_datum = DepthDatum.find(params[:id])
		end

end
