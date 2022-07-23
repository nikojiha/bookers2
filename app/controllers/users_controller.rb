class UsersController < ApplicationController
   before_action :correct_user, only: [:edit, :update]
  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "successfully" 
       redirect_to user_path(@user.id)
    else
      @users = User.all
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user). permit(:name, :introduction, :profile_image)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(current_user) unless @user == current_user
  end
  
end
