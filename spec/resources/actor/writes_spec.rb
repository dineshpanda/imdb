require 'rails_helper'

RSpec.describe ActorResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'actors',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ActorResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Actor.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:actor) { create(:actor) }

    let(:payload) do
      {
        data: {
          id: actor.id.to_s,
          type: 'actors',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ActorResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { actor.reload.updated_at }
      # .and change { actor.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:actor) { create(:actor) }

    let(:instance) do
      ActorResource.find(id: actor.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Actor.count }.by(-1)
    end
  end
end
