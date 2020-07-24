require 'rails_helper'

RSpec.describe "actors#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/actors", params: params
  end

  describe 'basic fetch' do
    let!(:actor1) { create(:actor) }
    let!(:actor2) { create(:actor) }

    it 'works' do
      expect(ActorResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['actors'])
      expect(d.map(&:id)).to match_array([actor1.id, actor2.id])
    end
  end
end
