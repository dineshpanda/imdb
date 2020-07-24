require "rails_helper"

RSpec.describe CastingResource, type: :resource do
  describe "serialization" do
    let!(:casting) { create(:casting) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(casting.id)
      expect(data.jsonapi_type).to eq("castings")
    end
  end

  describe "filtering" do
    let!(:casting1) { create(:casting) }
    let!(:casting2) { create(:casting) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: casting2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([casting2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:casting1) { create(:casting) }
      let!(:casting2) { create(:casting) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      casting1.id,
                                      casting2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      casting2.id,
                                      casting1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
