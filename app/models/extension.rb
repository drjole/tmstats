class Extension < ApplicationRecord
  has_and_belongs_to_many :games # standard:disable Rails/HasAndBelongsToMany

  validates :name, presence: true, uniqueness: true
end
