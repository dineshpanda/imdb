require 'rails_helper'

RSpec.describe MovieResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'movies',
          attributes: { }
        }
      }
    end

    let(:instance) do
      MovieResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Movie.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:movie) { create(:movie) }

    let(:payload) do
      {
        data: {
          id: movie.id.to_s,
          type: 'movies',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      MovieResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { movie.reload.updated_at }
      # .and change { movie.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:movie) { create(:movie) }

    let(:instance) do
      MovieResource.find(id: movie.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Movie.count }.by(-1)
    end
  end
end
