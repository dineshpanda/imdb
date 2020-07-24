class Casting < ApplicationRecord
  mount_uploader :profile, ProfileUploader

  # Direct associations

  belongs_to :actor

  belongs_to :movie

  # Indirect associations

  # Validations

  validates :actor_id, :presence => true

  validates :movie_id, :presence => true

  # Scopes

end
