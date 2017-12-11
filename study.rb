books = ["Charlie and the Chocolate Factory",
  "War and Peace",
  "Utopia",
  "A Brief History of Time",
  "A Wrinkle in Time"]
books.each_cons(3) do |fir, sec,thi|
  print fir,sec,thi
  puts ''
end


#메소드를 만들때 return을 안쓰게되면 마지막줄이 리턴됨
# 코드덩어리(Chunks of code) : {}혹은 do...end사이에 있는 코드. 하나의 파라미터로 메소드에 넘겨줌
#symbol은 고유하고 변경불가능한 자료형. (string은 주소값변경가능)
#루비의 배열은 숫자 문자 같이 만들수있음.
