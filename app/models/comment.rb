class Comment < ApplicationRecord

  
  # include PublicActivity::Model
  # tracked owner: :commenter, recipient: :commentee

  # belongs_to :commenter, :class_name => "User"
  # belongs_to :commentee, :class_name => "User"

  belongs_to :user
  belongs_to :micropost
end
