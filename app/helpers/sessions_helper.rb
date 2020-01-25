module SessionsHelper
  # 現在ログインしているユーザを取得する
  # @current_userが空の場合、find_byでsession[:user_id]をキーに取得する
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #ログインしていたらtrue、していなければfalseを返す
  # 上のcurrent_userを使って調べている
  def logged_in?
    !!current_user
  end
end

# if @current_user
#  return @current_user
# else
#  @current_user = User.find_by(id: session[:user_id])
#  return @current_user
# end