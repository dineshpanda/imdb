require 'rails_helper'

RSpec.describe DirectorResource, type: :resource do
  describe 'serialization' do
    let!(:director) { create(:director) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(director.id)
      expect(data.jsonapi_type).to eq('directors')
    end
  end

  describe 'filtering' do
    let!(:director1) { create(:director) }
    let!(:director2) { create(:director) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: director2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([director2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:director1) { create(:director) }
      let!(:director2) { create(:director) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            director1.id,
            director2.id
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
            director2.id,
            director1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
