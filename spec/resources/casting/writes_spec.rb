require 'rails_helper'

RSpec.describe CastingResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'castings',
          attributes: { }
        }
      }
    end

    let(:instance) do
      CastingResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Casting.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:casting) { create(:casting) }

    let(:payload) do
      {
        data: {
          id: casting.id.to_s,
          type: 'castings',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CastingResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { casting.reload.updated_at }
      # .and change { casting.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:casting) { create(:casting) }

    let(:instance) do
      CastingResource.find(id: casting.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Casting.count }.by(-1)
    end
  end
end
