require 'rails_helper'

RSpec.describe MovieResource, type: :resource do
  describe 'serialization' do
    let!(:movie) { create(:movie) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(movie.id)
      expect(data.jsonapi_type).to eq('movies')
    end
  end

  describe 'filtering' do
    let!(:movie1) { create(:movie) }
    let!(:movie2) { create(:movie) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: movie2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([movie2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:movie1) { create(:movie) }
      let!(:movie2) { create(:movie) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            movie1.id,
            movie2.id
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
            movie2.id,
            movie1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
