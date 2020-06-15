class ActivitiesController < ApplicationController
  def index
  	@activities = PublicActivity::Activity.order("created_at desc")

  	@num = PublicActivity::Activity.where(owner_id: current_user.id, key: "micropost.read").count

     @by_read_num = PublicActivity::Activity.where(trackable_id: 20, key: "micropost.read").count
  	#@num = PublicActivity::Activity.count works
  end
end
