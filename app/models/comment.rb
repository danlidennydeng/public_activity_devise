class Comment < ApplicationRecord

  
  include PublicActivity::Common
  #tracked recipient: ->(controller, model) { model && model.user }
 

  belongs_to :user
  belongs_to :micropost
end
