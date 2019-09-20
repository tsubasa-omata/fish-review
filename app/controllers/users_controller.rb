class UsersController < ApplicationController
  def index
   @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    flash[:notice] = ' 画像を保存しました '
  end

  private

  def user_params
    params.require(:user).permit(:picture,
                                 :name
                                 )
  end
end
