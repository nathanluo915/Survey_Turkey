helpers do
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @user ||= User.find(session[:user_id]) if logged_in?
  end

end
