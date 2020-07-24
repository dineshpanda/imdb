require "rails_helper"

RSpec.describe "castings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/castings/#{casting.id}", payload
  end

  describe "basic update" do
    let!(:casting) { create(:casting) }

    let(:payload) do
      {
        data: {
          id: casting.id.to_s,
          type: "castings",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CastingResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { casting.reload.attributes }
    end
  end
end
