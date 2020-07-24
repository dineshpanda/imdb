class ActorResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :bio, :string
  attribute :image, :string
  attribute :dob, :date

  # Direct associations

  has_many   :characters,
             resource: CastingResource

  # Indirect associations

end
