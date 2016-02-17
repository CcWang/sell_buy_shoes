class SessionsController < ApplicationController
  def index
  end
  
  def create
    if params[:user][:password] == params[:confirm_pw]
      user = User.new(get_user)
      if user.save
        session[:user_id] = user.id
        redirect_to '/shoes'
      else
        flash[:errors] = user.errors.full_messages
        redirect_to :back
      end
    else
      flash[:errors] = ['Password and Confrim PW does not match']
      redirect_to :back  
    end
      
  end

  def login
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/shoes'
     else
     flash[:errors] =['invalid email and password combination']
     redirect_to :back 
    end
  end

  def logout
    session[:user_id] =nil
    redirect_to '/'
  end
  private
  def get_user
    params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password)
  end
end
