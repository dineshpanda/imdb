require "rails_helper"

RSpec.describe "movies#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/movies/#{movie.id}", payload
  end

  describe "basic update" do
    let!(:movie) { create(:movie) }

    let(:payload) do
      {
        data: {
          id: movie.id.to_s,
          type: "movies",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(MovieResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { movie.reload.attributes }
    end
  end
end
