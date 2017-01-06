class ActivitiesController < ApplicationController
  def index
  	@activities = PublicActivity::Activity.order("created_at desc")

  	@num = PublicActivity::Activity.where(owner_id: current_user.id, key: "micropost.read").count
  	 #Person.count(:conditions => "age > 26 AND job.salary > 60000", :include => :job) # because of the named association, it finds the DISTINCT count using LEFT OUTER JOIN.
  	#@num = PublicActivity::Activity.count works
  end
end
