class UsersController < ApplicationController
  skip_before_action :require_login, :only => [:index, :new, :create]
  load_and_authorize_resources

  # required to be logged in before being able to see the page
  before_action :require_login


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # automatically log in the user to the website after he's created himself - this is method gained from sorcery
      # auto_login(@user)
      # # used when a user tries to access a page while logged out, is asked to login
      redirect_back_or_to root_url, :notice => "Signed up!  Please log in after you have authenicated"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :administrator, :first_name, :last_name, :password, :password_confirmation)
  end
end
