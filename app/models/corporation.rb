class Corporation < ApplicationRecord
  belongs_to :extension

  validates :name, presence: true, uniqueness: true

  default_scope -> { order(:name) }
end
