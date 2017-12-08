Dir.chdir("text") #text 폴더로 이동
#현재 폴더내의 .과 ..을 제외한 목록을 files에 저장
files = Dir.entries(Dir.pwd).reject {|i| i[0]=="."}
files.each do |name|
  File.rename(name, name.gsub("new","new_")) #name에서 new를 찾아 new_로 변경
end
