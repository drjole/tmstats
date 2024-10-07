class Corporation < ApplicationRecord
  belongs_to :extension

  default_scope -> { order(:name) }
end
