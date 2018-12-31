class PagesController < ApplicationController

  def home
    # display only 6 blog per page using will_paginate
    #search var is used to searching data in blog 
    if params[:search]
      # if search condition success
      @blogs =  Blog.where(["Title LIKE ?", "%#{params[:search]}%"]).paginate(:page => params[:page], :per_page => 6)
    else
        # if search condition is not success
      @blogs =  Blog.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
    end
    
  end
  def Myblogs
    # create object of blog to access blog in Myblog page
    @blogs =  Blog.all
  end

end
