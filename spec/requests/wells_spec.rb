# spec/requests/wells_spec.rb

require 'rails_helper'

RSpec.describe 'Wells API', type: :request do
  # initialize test data
  let!(:wells) { create_list(:well, 10) }
  let(:well_id) { wells.first.id }

  # Test suite for GET /wells
  describe 'GET /wells' do
    # make HTTP get request before each example
    before { get '/wells' }

    it 'returns wells' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  	# Test suite for GET /wells/:id
	describe 'GET /wells/:id' do
		before { get "/wells/#{well_id}" }

		context 'when the record exists' do
			it 'returns the well' do
				expect(json).not_to be_empty
				expect(json['id']).to eq(well_id)
			end

			it 'returns status code 200' do
				expect(response).to have_http_status(200)
			end
		end

		context 'when the record does not exist' do
			let(:well_id) { 100 }

			it 'returns status code 404' do
				expect(response).to have_http_status(404)
			end

			it 'returns a not found message' do
				expect(response.body).to match(/Couldn't find Well/)
			end

		end

	end

end