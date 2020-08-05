class Image < ApplicationRecord
  mount_uploader :file_name, PictureUploader
end
