require 'rails_helper'

RSpec.describe "castings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/castings/#{casting.id}"
  end

  describe 'basic destroy' do
    let!(:casting) { create(:casting) }

    it 'updates the resource' do
      expect(CastingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Casting.count }.by(-1)
      expect { casting.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
