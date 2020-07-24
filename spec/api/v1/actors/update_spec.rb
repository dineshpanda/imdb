require "rails_helper"

RSpec.describe "actors#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/actors/#{actor.id}", payload
  end

  describe "basic update" do
    let!(:actor) { create(:actor) }

    let(:payload) do
      {
        data: {
          id: actor.id.to_s,
          type: "actors",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ActorResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { actor.reload.attributes }
    end
  end
end
