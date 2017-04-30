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

		# Test suite for POST /wells
	describe 'POST /wells' do
		# valid payload
		let(:valid_attributes) {
			{
				name: 'Fred',
				start_date: "Fri, 03 Oct 2014",
				end_date:  "Wed, 03 Jan 2015",
				total_depth:  6289,
				well_number:  127
			}
		}

		context 'when the request is valid' do
			before { post '/wells', params: valid_attributes }

			it 'creates a well' do
				expect(json['name']).to eq('Fred')
				expect(json['start_date']).to eq('2014-10-03')
				expect(json['end_date']).to eq('2015-01-03')
				expect(json['total_depth']).to eq('6289.0')
				expect(json['well_number']).to eq(127)
			end

			it 'returns status code 201' do
				expect(response).to have_http_status(201)
			end
		end

		context 'when the request is invalid' do
			before { post '/wells', params: { name: 'Hector' } }

			it 'returns status code 422' do
				expect(response).to have_http_status(422)
			end

			it 'returns a validation failure message' do
				expect(response.body)
					.to match(/Validation failed: Well number can't be blank/)
			end
		end
	end

# Test suite for PUT /wells/:id
	describe 'PUT /wells/:id' do
		let(:valid_attributes) { { name: 'Shopping' } }

		context 'when the record exists' do
			before { put "/wells/#{well_id}", params: valid_attributes }

			it 'updates the record' do
				expect(response.body).to be_empty
			end

			it 'returns status code 204' do
				expect(response).to have_http_status(204)
			end

		end
	end

	# Test suite for DELETE /wells/:id
	describe 'DELETE /wells/:id' do
		before { delete "/wells/#{well_id}" }

		it 'returns status code 204' do
			expect(response).to have_http_status(204)
		end

	end

end