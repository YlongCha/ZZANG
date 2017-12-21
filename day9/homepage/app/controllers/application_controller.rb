class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  protect_from_forgery with: :exception
  def current_user
    if session[:user_id].nil?
      @user = nil
    else
      @user = User.find(session[:user_id])
    end
  end
  helper_method :current_user #뷰에서 current_user메소드를 사용할 수 있게 helper에 추가
end
