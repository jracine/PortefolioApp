class Image < ActiveRecord::Base
  attr_accessible :title, :user_id, :description, :path

  belongs_to :user

end
