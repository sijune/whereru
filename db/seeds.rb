# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# 신웅 category 및 seed 테스트용 (180806) -> (180816)
(1..100).each do |c|
    (1..30).each do |i|
        # 생활정보
        if c ==11
            Post.create(title:"자유게시판 #{i}번 test", content:"자유게시판 #{i}번", user_id:1, category_id:c)
        elsif c==12
            Post.create(title:"뉴스 #{i}번 test", content:"구인구직 #{i}번", user_id:1, category_id:c)
        elsif c==13
            Post.create(title:"쉐어하우스 #{i}번 test", content:"쉐어하우스 #{i}번", user_id:1, category_id:c)
        elsif c==14
            Post.create(title:"벼룩시장 #{i}번 test", content:"벼룩시장 #{i}번", user_id:1, category_id:c)
        elsif c==15
            Post.create(title:"세일정보 #{i}번 test", content:"뉴스 #{i}번", user_id:1, category_id:c)
        elsif c==16
            Post.create(title:"해외특송 #{i}번 test", content:"추천과좋아요 #{i}번", user_id:1, category_id:c)
        elsif c==17
            Post.create(title:"생활꿀팁 #{i}번 test", content:"슷허디 #{i}번", user_id:1, category_id:c)
        
          # 소소한 이야기
        elsif c==21
            Post.create(title:"연애이야기 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        elsif c==22
            Post.create(title:"일상이야기 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        elsif c==23
            Post.create(title:"익명이야기 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        elsif c==24
            Post.create(title:"영어단어 퀴즈 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        elsif c==25
            Post.create(title:"달러거래 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        elsif c==26
            Post.create(title:"정치/사회 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        
         # 여행/맛집
        elsif c==31
            Post.create(title:"같이가요 #{i}번 test", content:"세일정보 #{i}번", user_id:1, category_id:c)
        elsif c==32
            Post.create(title:"여행지 추천 #{i}번 test", content:"구직 #{i}번", user_id:1, category_id:c)
        elsif c==33
            Post.create(title:"여행후기 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        elsif c==34
            Post.create(title:"맛집 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
            
        # 모임/과외
        elsif c==41
            Post.create(title:"소모임 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        elsif c==42
            Post.create(title:"영어 스터디 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        elsif c==43
            Post.create(title:"언어교환 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        elsif c==44
            Post.create(title:"과외 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        
        
        # 법률/상담
        elsif c==51
            Post.create(title:"텍스 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        elsif c==52
            Post.create(title:"연금 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        elsif c==53
            Post.create(title:"이민상담 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        elsif c==54
            Post.create(title:"유학상담 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)

        
         # 구인/구직
        elsif c==61
            Post.create(title:"구인 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
        elsif c==62
            Post.create(title:"구직 #{i}번 test", content:"맛집 #{i}번", user_id:1, category_id:c)
            
        end
    end
end

