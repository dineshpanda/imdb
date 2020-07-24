class DirectorResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :bio, :string
  attribute :image, :string

  # Direct associations

  has_many :movies

  # Indirect associations
end
