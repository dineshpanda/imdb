require 'rails_helper'

RSpec.describe ActorResource, type: :resource do
  describe 'serialization' do
    let!(:actor) { create(:actor) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(actor.id)
      expect(data.jsonapi_type).to eq('actors')
    end
  end

  describe 'filtering' do
    let!(:actor1) { create(:actor) }
    let!(:actor2) { create(:actor) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: actor2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([actor2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:actor1) { create(:actor) }
      let!(:actor2) { create(:actor) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            actor1.id,
            actor2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            actor2.id,
            actor1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
