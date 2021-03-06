class Director < ApplicationRecord
  # Direct associations

  has_many   :movies,
             dependent: :destroy

  # Indirect associations

  # Validations

  validates :name, presence: true

  # Scopes
end
