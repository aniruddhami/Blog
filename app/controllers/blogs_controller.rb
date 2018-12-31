class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :checkAdmin, only: [:edit,:destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    # create object of blog to access blog in home page
    @blogs = Blog.all
  end
  
  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    # to create a new blog
    @blog = Blog.new(blog_params)
           
    respond_to do |format|
      if @blog.save
          
        format.html { redirect_to pages_Myblogs_path, notice: blog_params[:Title ].to_s + 'Blog was successfully created.'}
        format.json { render :show, status: :created, location: pages_Myblogs_path }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    # to update a new blog
    respond_to do |format|
      if @blog.update(blog_params)
        # check its admin blog or another person blog and redirect to specific path
        if  blog_params[:email ] == current_admin.email then
          format.html { redirect_to pages_Myblogs_path, notice: 'Blog was successfully updated.' }
          format.json { render :show, status: :ok, location: @blog }
        else
          format.html { redirect_to root_path, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
        end
       
        
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|

        # if request.headers["HTTP_REFERER"] == "http://localhost:3000/Blog"
        # check the working page and redirect to specific page after deleting blog
        if request.headers["HTTP_REFERER"] == "http://localhost:3000/pages/Myblogs"
         format.html { redirect_to pages_Myblogs_path, notice:   'Blog was successfully destroyed.' }
         format.json { head :no_content }
       else
          format.html { redirect_to root_path, notice:   'Blog was successfully destroyed.' }
          format.json { head :no_content }
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:Title, :image, :Discription, :email)
    end
end
