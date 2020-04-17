class UsersController < ApplicationController
  def show
    find_user
  end

  def edit
    find_user
  end

  def new
    @user = User.new
  end

  def update
    find_user
    
    if @user.update user_clean
      redirect_to user_path, notice: '成功修改使用者資料!'
    else
      render :edit
    end
  end
  
  private
  def find_user
    @user = User.find(params[:id])
  end
  def user_clean
    params.require(:user).permit(:email, :password, :tel, :password_confirmation)
  end
end
