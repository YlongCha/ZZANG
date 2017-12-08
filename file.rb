Dir.chdir("text") #text 폴더로 이동
20.times do |i| #파일 생성을 20번 반복, i로 파일이름을 변경
  i += 1
  File.open("newfile#{i}.txt","w+") do |file|# newfile을 열어서 내용입력
    file.write("hello world")#newfile에 hello world를 작성
  end
end
