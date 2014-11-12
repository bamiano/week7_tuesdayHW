class AccessController < ApplicationController
  def signup
  	@user = User.new
  end

  def login

  end

 	# app.get('/login', routeMiddleware.preventLoginSignup, function(req,res){
  #   res.render('login', {message: req.flash('loginMessage'), username: ""});
	# });

  def home
  end

  def logout
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You're all signed up!"
      redirect_to home_path
    	else
      render :signup
    end
  end

  def attempt_login
  	 if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
  	end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password, :password_digest)
  end
end
