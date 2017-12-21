class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    @user = User.last
  end

  def login

  end

  def login_process
    @user = User.find_by(email: params[:email])
    @msg = ""
    #메일주소가 가입한 적이 없으면
    if @user.nil?
      #없는 ID 표시(가입 권유)
      flash[:alert] = "등록되지 않은 아이디입니다. 등록하십시오."
      redirect_to "/user/new"
      #메일주소가 가입했으면 비밀번호 확인
    else
      #비밀번호가 맞으면 로그인
      if @user.password == params[:password]#DB에있는 비번과 == form 비밀번호
        session[:user_id] = @user.id #서버안에 둥둥떠다님
        flash[:notice] = "#{@user.name}님 로그인 되었습니다"
        redirect_to "/"
      #틀리면 비밀번호 틀렸다 표시
      else
        flash[:alert] = "비밀번호가 틀렸습니다."
        redirect_to :back
      end
    end
  end

  def logout
    session.clear
    flash[:alert] = "로그아웃"
    redirect_to "/"
  end
end
