require "rails_helper"

RSpec.describe "directors#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/directors/#{director.id}", params: params
  end

  describe "basic fetch" do
    let!(:director) { create(:director) }

    it "works" do
      expect(DirectorResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("directors")
      expect(d.id).to eq(director.id)
    end
  end
end
