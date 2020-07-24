require "rails_helper"

RSpec.describe "movies#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/movies", params: params
  end

  describe "basic fetch" do
    let!(:movie1) { create(:movie) }
    let!(:movie2) { create(:movie) }

    it "works" do
      expect(MovieResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["movies"])
      expect(d.map(&:id)).to match_array([movie1.id, movie2.id])
    end
  end
end
