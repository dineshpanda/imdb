require 'rails_helper'

RSpec.describe "directors#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/directors/#{director.id}", payload
  end

  describe 'basic update' do
    let!(:director) { create(:director) }

    let(:payload) do
      {
        data: {
          id: director.id.to_s,
          type: 'directors',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(DirectorResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { director.reload.attributes }
    end
  end
end
