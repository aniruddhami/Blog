json.extract! blog, :id, :Title, :image, :Discription, :email, :created_at, :updated_at
json.url blog_url(blog, format: :json)
