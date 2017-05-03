# app/requests/depth_data_spec.rb
require 'rails_helper'

RSpec.describe 'DepthData API' do
  # Initialize the test data
  let!(:well) { create(:well) }
  let!(:depth_data) { create_list(:depth_datum, 5, well_id: well.id) }
  let(:well_id) { well.id }
  let(:id) { depth_data.first.id }

  # Test suite for GET /wells/:well_id/items
  describe 'GET /wells/:well_id/depth_data' do
    before { get "/wells/#{well_id}/depth_data" }

    context 'when well depth_data exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all well depth_data' do
        expect(json.size).to eq(5)
      end
    end

    context 'when well does not exist' do
      let(:well_id) {  }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Well/)
      end
    end
  end

  # Test suite for GET /wells/:well_id/items/:id
  describe 'GET /wells/:well_id/items/:id' do
    before { get "/wells/#{well_id}/depth_data/#{id}" }

    context 'when well depth_datum exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the depth_datum' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when well depth_datum does not exist' do
      let(:id) { 9999}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find DepthDatum/)
      end
    end
  end

  # Test suite for PUT /wells/:well_id/items
  describe 'POST /wells/:well_id/depth_data' do
    let(:valid_attributes) do
    	{ depth: 100.2, well_id: 1 }
    	# p valid_attributes
    end


    context 'when request attributes are valid' do
      before { post "/wells/#{well_id}/depth_data", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/wells/#{well_id}/depth_data", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Well must exist, Depth can't be blank/)
      end
    end
  end

  # Test suite for PUT /wells/:well_id/depth_data/:id
  describe 'PUT /wells/:well_id/depth_data/:id' do
    let(:valid_attributes) { { depth: 0 } }

    before { put "/wells/#{well_id}/depth_data/#{id}", params: valid_attributes }

    context 'when item exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_item = DepthDatum.find(id)
        expect(updated_item.depth).to match(0)
      end
    end

    context 'when the item does not exist' do
      let(:id) { 9999 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find DepthDatum/)
      end
    end
  end

  # Test suite for DELETE /wells/:id
  describe 'DELETE /wells/:id' do
    before { delete "/wells/#{well_id}/depth_data/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end