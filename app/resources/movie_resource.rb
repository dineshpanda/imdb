class MovieResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :year, :string
  attribute :director_id, :integer
  attribute :image, :string

  # Direct associations

  belongs_to :dictator,
             resource: DirectorResource,
             foreign_key: :director_id

  has_many   :characters,
             resource: CastingResource

  # Indirect associations

end
