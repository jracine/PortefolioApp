module SessionsHelper
  def authenticate
    deny_access unless signed_in?
  end

   def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.password_salt]
    self.current_user = user
  end

   def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    @current_user = nil
  end


  private
  
    def user_from_remember_token
     # User.authenticate_with_salt(*remember_token)
     User.authenticate_with_salt(*remember_token)
    end
    
    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

    
  def deny_access
    redirect_to log_in_path, :notice => "Please sign in to access this page."
  end

  def current_user?(user)
    user == current_user
  end

  
  
end
