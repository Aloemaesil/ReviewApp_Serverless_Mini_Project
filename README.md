# AWS를 이용한 Serverless Review Application Team Project

UI 및 프론트엔드 작업

## 구현 기능
0. 사용자 식별을 위한 로그인(?)
  - 사용자 id
  - 사용자 pw

1. 게시글 리스트를 보는 기능
  - 게시글 리스트 구성을 위한 최소 데이터 전송
  - 프론트에서 개별 게시글 클릭 시 req
  - 해당 게시글에 대한 전체 데이터 res

 * 이 때 게시글 리스트 구현을 위해 받아올 데이터 정보
  - 게시글 id => 주요 키
  - 제목
  - 카테고리 => 파티션 키
  - 이미지
  - 별점
  - 댓글 수
  - 좋아요 수( 여유가 있을 때 ) 

2. 게시글 작성 기능 (Post)
    - 사용자 id  
    - 제목
    - 카테고리
    - 가격
    - 이미지
    - 내용
    - 별점
   => 해당 내용 post

3. 게시글 개별 보기 기능
    - *게시글 id
    - 사용자 id
    - 제목
    - 카테고리
    - 가격
    - 이미지
    - 내용
    - 별점 
    - 댓글
  3-1.게시글 수정 삭제 기능 
  3-2. 댓글 작성 기능


## 현재 작업중



## 수정 및 구현이 필요한 기능




