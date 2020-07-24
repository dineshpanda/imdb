require 'rails_helper'

RSpec.describe "castings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/castings/#{casting.id}", params: params
  end

  describe 'basic fetch' do
    let!(:casting) { create(:casting) }

    it 'works' do
      expect(CastingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('castings')
      expect(d.id).to eq(casting.id)
    end
  end
end
