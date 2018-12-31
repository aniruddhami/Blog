class ApplicationController < ActionController::Base
  before_action :application
  protect_from_forgery with: :exception
  # create object of blog class
  def application
  @blogs=Blog.all
  end

   private
  # check user logined or not also check if it is admin or not
  def checkAdmin
    if !admin_signed_in?
      # if current user is not an admin then can't access the page like add teacher,department,college and new subject
      redirect_to root_path, notice: "Only Admin Can Access This Page"
    end
  end
end
