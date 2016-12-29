class Micropost < ApplicationRecord

  include PublicActivity::Common
  #tracked owner: ->(controller, model) { controller && controller.current_user }

  belongs_to :user
  has_many :comments
end
