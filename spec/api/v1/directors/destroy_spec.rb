require "rails_helper"

RSpec.describe "directors#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/directors/#{director.id}"
  end

  describe "basic destroy" do
    let!(:director) { create(:director) }

    it "updates the resource" do
      expect(DirectorResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Director.count }.by(-1)
      expect { director.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
