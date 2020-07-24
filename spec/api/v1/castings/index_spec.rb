require 'rails_helper'

RSpec.describe "castings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/castings", params: params
  end

  describe 'basic fetch' do
    let!(:casting1) { create(:casting) }
    let!(:casting2) { create(:casting) }

    it 'works' do
      expect(CastingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['castings'])
      expect(d.map(&:id)).to match_array([casting1.id, casting2.id])
    end
  end
end
