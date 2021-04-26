class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice]= "You have updated user successfully"
      redirect_to user_path(current_user)
    else
      @books = @user.books
      @book = Book.new
      render 'edit'
    end
  end

  def destroy
  end

  private

  def ensure_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
    redirect_to user_path(current_user)
    end
  end


  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end





