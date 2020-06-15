class ApplicationController < ActionController::Base

  before_filter :authenticate_user!

  #include PublicActivity::StoreController

  protect_from_forgery with: :exception

end
