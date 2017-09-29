module DeviseHelper
	def devise_error_messages!
	  return '' unless devise_error_messages?  
		flash[:notice] = resource.errors.full_messages.first
	end
  
	def devise_error_messages?
	  !resource.errors.empty?
	end  
end
