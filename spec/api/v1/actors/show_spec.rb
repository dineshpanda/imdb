require "rails_helper"

RSpec.describe "actors#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/actors/#{actor.id}", params: params
  end

  describe "basic fetch" do
    let!(:actor) { create(:actor) }

    it "works" do
      expect(ActorResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("actors")
      expect(d.id).to eq(actor.id)
    end
  end
end
