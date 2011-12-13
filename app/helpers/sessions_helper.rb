module SessionsHelper
  def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    store_location
    redirect_to sign_up_path, :notice => "Please sign in to access this page."
  end
end
