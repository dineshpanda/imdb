require "rails_helper"

RSpec.describe "movies#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/movies/#{movie.id}"
  end

  describe "basic destroy" do
    let!(:movie) { create(:movie) }

    it "updates the resource" do
      expect(MovieResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Movie.count }.by(-1)
      expect { movie.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
