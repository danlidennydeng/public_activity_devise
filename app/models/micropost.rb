class Micropost < ApplicationRecord

  include Humanizer
  require_human_on :create

  include PublicActivity::Common
  #tracked owner: ->(controller, model) { controller && controller.current_user }

  belongs_to :user
  has_many :comments

  # def name_short
  #   name.to_s.split('')[0]
  # end
  # before_validation do
  #   self.average = ((attitude.to_i + fix_time.to_i + fix_result.to_i)/3.0).round(2)
  # end
  #
  # after_save do
  #   left_over = (content.length.to_i - 140)
  # end

  def left_over
    content.length.to_i - 140
    
  end

end
