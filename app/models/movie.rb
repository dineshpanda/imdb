class Movie < ApplicationRecord
  # Direct associations

  belongs_to :dictator,
             :class_name => "Director",
             :foreign_key => "director_id"

  has_many   :characters,
             :class_name => "Casting",
             :dependent => :destroy

  # Indirect associations

  has_many   :actors,
             :through => :characters,
             :source => :actor

  # Validations

  validates :title, :uniqueness => { :scope => [:year, :director_id] }

  validates :title, :presence => true

  # Scopes

end
