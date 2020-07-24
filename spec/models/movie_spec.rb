require 'rails_helper'

RSpec.describe Movie, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:characters) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:title).scoped_to(:year).scoped_to(:director_id) }

    it { should validate_presence_of(:title) }

    end
end
