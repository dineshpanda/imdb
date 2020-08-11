class Director < ApplicationRecord
  # Direct associations

  has_many   :movies,
             dependent: :destroy

  # Indirect associations

  # Validations

  validates :name, presence: true

  # Scopes

  def to_s
    name
  end
end
