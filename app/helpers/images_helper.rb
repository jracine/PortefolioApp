module ImagesHelper

	def is_user_logged_in?
	  	if current_user?(@user)
	  		mount_uploader :path, PhotoUploader
	  	else
	  		uploader = CacheUploader.new
	  		uploader.cache!(:path)
	  		uploader.retrieve_from_cache!(:path)
		end
	end

end
