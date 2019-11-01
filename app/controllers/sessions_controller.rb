class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user   #ここのuserは　user = User.find_by(email: params[:session][:email].downcase)のローカル変数userのことだよな
      params[:session][:remember_me] == '1'? remember(user) : forget(user)
      # remember user  #SessionsHelper中のメソッド(このメソッドにはuserという引数があり今回はそこに、このcreateアクションのローカル変数userに代入されたインスタンスが代入される)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

end