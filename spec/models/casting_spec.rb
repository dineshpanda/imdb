require 'rails_helper'

RSpec.describe Casting, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:actor_id) }

    it { should validate_presence_of(:movie_id) }

    end
end
