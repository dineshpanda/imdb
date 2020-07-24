require 'rails_helper'

RSpec.describe "movies#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/movies/#{movie.id}", params: params
  end

  describe 'basic fetch' do
    let!(:movie) { create(:movie) }

    it 'works' do
      expect(MovieResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('movies')
      expect(d.id).to eq(movie.id)
    end
  end
end
