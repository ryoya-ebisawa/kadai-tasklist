class SessionsController < ApplicationController
  def new
  end

  #ログイン処理
  #session[:user_id] にログインユーザの id が代入された時点でログイン完了
  #ブラウザのcookieにもログイン情報が保存される
  def create
    # viewのフォームの内容を設定
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
    
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to login_url
  end
  
  private
  
  def login(email , password)
    #フォームのemailとテーブルのemailが一致する情報を取得
    @user = User.find_by(email: email)
    #authenticate(password)でフォームのパスワードでログイン認証
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
  
end
