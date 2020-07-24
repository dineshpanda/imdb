require 'rails_helper'

RSpec.describe "directors#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/directors", params: params
  end

  describe 'basic fetch' do
    let!(:director1) { create(:director) }
    let!(:director2) { create(:director) }

    it 'works' do
      expect(DirectorResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['directors'])
      expect(d.map(&:id)).to match_array([director1.id, director2.id])
    end
  end
end
