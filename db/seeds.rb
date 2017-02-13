# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin

=end
schools = %W[가천대(글로벌)
가톨릭대(성심)
강원대
건국대(서울)
건국대(글로컬)
건양대
경북대
경상대
경성대
경희대(서울)
경희대(국제)
계명대
고려대(안암)
광운대
국민대
남서울대
단국대(죽전)
단국대(천안)
덕성여대
동국대
동덕여대
명지대(인문)
명지대(자연)
부산대
상명대
상지대
서강대
서울과기대
서울대
서울시립대
선문대
성공회대
성균관대(인문사회)
성균관대(자연과학)
성신여대
세종대
숙명여대
순천향대
숭실대
아주대
연세대(신촌)
영남대
원광대
이화여대
인천대
전남대
전북대
중앙대(서울)
충남대
충북대
평택대
포항공과대
한국기술교대
한국예술종합학교
한국외대(글로벌)
한국항공대
한밭대
한성대
한양대(서울)
한양대(ERICA)
DGIST
KAIST
UNIST]

schools.each do |s|
  School.create(name: s)
end

m = Master.new
m.email = "tutan123@naver.com"
m.password = "whdcks11"
m.password_confirmation = "whdcks11"
m.name = "이종찬"
m.school_id = 49
m.status = "join"
m.save

