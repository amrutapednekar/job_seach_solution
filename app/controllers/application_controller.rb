class ApplicationController < ActionController::Base

helper_method :current_user
helper_method :logged_in?
before_action :authorized

# Checkes if session user is present
def current_user
   User.find_by(id: session[:user_id])
end

# Checkes if user is logged in or not
def logged_in?  
    !current_user.nil?
end

# Checks if any user is logged in or not
# If no user is logged in, returns to welcome page
def authorized
    redirect_to '/welcome' unless logged_in?
end

end
