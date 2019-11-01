class UsersController < ApplicationController
  before_action :authenticate_user , only:[:show]
  before_action :correct_user,   only: [:edit, :update]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy] #admin edit でこれはlogin　しているから回避できる
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save                                       #ここでbefore_actionのcreate_activation_digestが実行される。
      @user.send_activation_email                      #このsend_activation_emailメソッドの中のaccount_activationはuser_mailerのメソッド？それともuser_mailer_previewのメソッド？
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password_confirmation,
                                 :picture,
                                 :account_name
                                  )
  end
  
end
