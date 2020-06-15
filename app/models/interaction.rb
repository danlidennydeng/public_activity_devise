class Interaction < ApplicationRecord
  belongs_to :interactive, polymorphic: true

  #validates :description, presence: true
end
