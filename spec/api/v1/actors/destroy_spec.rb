require 'rails_helper'

RSpec.describe "actors#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/actors/#{actor.id}"
  end

  describe 'basic destroy' do
    let!(:actor) { create(:actor) }

    it 'updates the resource' do
      expect(ActorResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Actor.count }.by(-1)
      expect { actor.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
