class HomeController < ApplicationController
  def index
  end

  def lotto
    @lotto = (1..45).to_a.sample(6).sort
  end

  def welcome
    @name = params[:name]
  end

  def square
    @number = params[:number]
  end


  def google
    @q = params[:q]
  end

  def lunchpic
    @lunch = ["오스뤠일뤼아","호주","오세아니아","남태평양대빵"].sample
    url = {"오스트뤠일아" => "http://dbscthumb.phinf.naver.net/2765_000_136/20131025011206442_5SJ8RSXZ4.jpg/1393237.jpg?type=m4500_4500_fst",
      "호주" => "http://snacker.hankyung.com/wp-content/uploads/2015/08/iQzbMm4NVcLd8NxtKEx.jpg"
    }
    @lunch_url = url[@lunch]
  end

  def random
    @PC_RCK = ["가위","바위","보"]
    url = {
      "가위" => "https://cdn.pixabay.com/photo/2017/04/04/17/16/scissors-2202215_960_720.jpg",
      "바위" => "http://cfile7.uf.tistory.com/image/174CD84E500847E82AD114",
      "보" => "http://img.hani.co.kr/imgdb/resize/2017/0614/00502677_20170614.JPG"
      }
    @PC_RCK_URL = url[@PC_RCK]
  end
end
