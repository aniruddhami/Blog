class Blog < ApplicationRecord
  # to upload an image
  mount_uploader :image, ImageUploader
end
