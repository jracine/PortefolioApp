class Image < ActiveRecord::Base
  attr_accessible :title, :user_id, :description, :path

  belongs_to :user
  mount_uploader :path, PhotoUploader

end
