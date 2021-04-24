class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(current_user)
      flash[:notice]= "You have updated user successfully"
    else
      render :edit
    end
  end

  def destroy
  end

  def index
    @users = User.all
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end





