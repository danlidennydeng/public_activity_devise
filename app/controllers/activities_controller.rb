class ActivitiesController < ApplicationController
  def index
  	@activities = PublicActivity::Activity.order("created_at desc")

  	@num = PublicActivity::Activity.where(owner_id: current_user.id, key: "micropost.read").count
  	 
  	#@num = PublicActivity::Activity.count works
  end
end
