import 'dart:convert';

import 'package:http/http.dart' as http;

class UserInfo {
  late String userId = "rkskek12";
  late String userNickName = "userA";
  late String password;
  late String address = "경기도 안양시 동안구";
}

class ContentsRepository {
  List<Map<String, dynamic>> data = [];
  Map<String, dynamic> datas = {
    "sell": [
      {
        "id": 14,
        "image": [
          "https://mblogthumb-phinf.pstatic.net/MjAyMjA3MjVfMjM1/MDAxNjU4NzUzNzMyODg3.Qwu8gukKuTFJozEkKZ_IK4scnxhFNd_Mdb5HGJ7QffQg.GSNUixvyp-umA67PLKkODy1PT6ih4cXYCrJCGQMJeT8g.JPEG.gjwjqan1/IMG_2471.jpg?type=w800",
        ],
        "boardWriter": "22",
        "boardTitle": "[ 연남동 맛집 ] 하쿠텐 이에케 라멘 리뷰",
        "boardContents": "22",
        "category": "음식", //카테고리
        "price": 9000,
        "boardHits": 2,
        "boardCreatedTime": "2023-03-24T18:31:47.576233",
        "boardUpdatedTime": "2023-03-31T09:25:00",
      },
      {
        "id": 15,
        "image": [
          "https://files.itworld.co.kr/ITW_202209_02/m26-iphone-14-pro-max-back-3.jpg",
        ],
        "boardWriter": "test123",
        "boardTitle": "아이폰 14 프로 맥스 리뷰 | 배터리 용량 줄고, 사용 시간 늘고… 여전히 '끝판왕'",
        "boardContents": "ㅇㅇㅇ",
        "location": "전자기기 / 가전",
        "price": 1840000,
        "boardHits": 7,
        "boardCreatedTime": "2023-03-28T19:32:48.417641",
        "boardUpdatedTime": "2023-03-31T09:25:00",
      },
      {
        "id": 16,
        "image": [
          "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTEyMjBfMzMg%2FMDAxNjM5OTg4NzY0Mzk2.iRIaBhXFG89n2HtV4-7WAM5wOE5F1fh53QzGRO7joW0g.RMUSC7ylgO-jfCN8rRoMFtG33FB8KO34PkjVK-kPcX4g.JPEG.cyj95828%2F1.jpg&type=sc960_832",
        ],
        "boardWriter": "input",
        "boardTitle": "[ 잇츠스킨 ] 파워10 포뮬라 엘아이 토너패드 리뷰",
        "boardContents": "해머드슈퍼 릴",
        "location": "화장품",
        "price": 19400,
        "boardHits": 10,
        "boardCreatedTime": "2023-03-28T10:59:10.492566",
        "boardUpdatedTime": "2023-03-31T09:25:00",
      },
      {
        "id": 16,
        "image": [
          "https://chitsol.com/wp-content/uploads/2022/02/Galaxy_Tab_S8_plus_04.jpg",
        ],
        "boardWriter": "input",
        "boardTitle": "삼성 갤럭시탭 S8 언박싱 및 간단 후기",
        "boardContents": "해머드슈퍼 릴",
        "location": "전자기기 / 가전",
        "price": 990000,
        "boardHits": 15,
        "boardCreatedTime": "2023-03-28T10:59:10.492566",
        "boardUpdatedTime": "2023-03-31T09:25:00",
      },
      {
        "id": 16,
        "image": [
          "https://mblogthumb-phinf.pstatic.net/MjAyMzA3MjRfMjE4/MDAxNjkwMTgyOTg0MDY0.c6lWdUXM0f5j3MzpToS6UvULRLkUJ9v-4SJDRm8b9LAg.HBKs8_bxSP7QxBULQs9l1LvvlFcP13vZAVKXCCjRelUg.JPEG.alswl0224/SE-1EC18C3C-F61B-4396-AA52-92975F53BAA7.jpg?type=w800",
        ],
        "boardWriter": "input",
        "boardTitle": "이삭토스트 신메뉴, 불고기 스페셜 후기",
        "boardContents": "해머드슈퍼 릴",
        "location": "음식",
        "price": 4900,
        "boardHits": 10,
        "boardCreatedTime": "2023-03-28T10:59:10.492566",
        "boardUpdatedTime": "2023-03-31T09:25:00",
      },
      {
        "id": 16,
        "image": [
          "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTEyMjBfMzMg%2FMDAxNjM5OTg4NzY0Mzk2.iRIaBhXFG89n2HtV4-7WAM5wOE5F1fh53QzGRO7joW0g.RMUSC7ylgO-jfCN8rRoMFtG33FB8KO34PkjVK-kPcX4g.JPEG.cyj95828%2F1.jpg&type=sc960_832",
        ],
        "boardWriter": "input",
        "boardTitle": "[ 잇츠스킨 ] 파워10 포뮬라 엘아이 토너패드 리뷰",
        "boardContents": "해머드슈퍼 릴",
        "location": "화장품",
        "price": 19400,
        "boardHits": 10,
        "boardCreatedTime": "2023-03-28T10:59:10.492566",
        "boardUpdatedTime": "2023-03-31T09:25:00",
      }
    ],
    "buy": [
      {
        "id": 14,
        "image": [
          "https://greendroprecycling.com/wp-content/uploads/2017/04/GreenDrop_Station_Aluminum_Can_Pepsi-300x300.jpg",
          "https://greendroprecycling.com/wp-content/uploads/2017/04/GreenDrop_Station_Aluminum_Can_Coke-300x300.jpg",
          "https://www.tylenolprofessional.com/sites/tylenol_hcp_us/files/sample-display-image/tylenol-product-samples600x600.jpg",
        ],
        "boardWriter": "22",
        "boardTitle": "22",
        "boardContents": "22",
        "location": "서울",
        "price": 20000,
        "boardHits": 2,
        "boardCreatedTime": "2023-03-24T18:31:47.576233",
        "boardUpdatedTime": "2023-03-31T09:25:00",
      },
      {
        "id": 15,
        "image": [
          "https://greendroprecycling.com/wp-content/uploads/2017/04/GreenDrop_Station_Aluminum_Can_Pepsi-300x300.jpg",
          "https://greendroprecycling.com/wp-content/uploads/2017/04/GreenDrop_Station_Aluminum_Can_Coke-300x300.jpg",
          "https://www.tylenolprofessional.com/sites/tylenol_hcp_us/files/sample-display-image/tylenol-product-samples600x600.jpg",
        ],
        "boardWriter": "test123",
        "boardTitle": "안녕하세요",
        "boardContents": "ㅇㅇㅇ",
        "location": "강남",
        "price": 25000,
        "boardHits": 7,
        "boardCreatedTime": "2023-03-28T19:32:48.417641",
        "boardUpdatedTime": "2023-03-31T09:25:00",
      },
      {
        "id": 16,
        "image": [
          "https://greendroprecycling.com/wp-content/uploads/2017/04/GreenDrop_Station_Aluminum_Can_Pepsi-300x300.jpg",
          "https://greendroprecycling.com/wp-content/uploads/2017/04/GreenDrop_Station_Aluminum_Can_Coke-300x300.jpg",
          "https://www.tylenolprofessional.com/sites/tylenol_hcp_us/files/sample-display-image/tylenol-product-samples600x600.jpg",
        ],
        "boardWriter": "input",
        "boardTitle": "test",
        "boardContents": "슈퍼 해머드릴",
        "location": "부천시 경인로",
        "price": 120000,
        "boardHits": 10,
        "boardCreatedTime": "2023-03-28T10:59:10.492566",
        "boardUpdatedTime": "2023-03-31T09:25:00",
      }
    ],
    "rental": [
      {
        "id": 14,
        "image": [
          "https://greendroprecycling.com/wp-content/uploads/2017/04/GreenDrop_Station_Aluminum_Can_Pepsi-300x300.jpg",
          "https://greendroprecycling.com/wp-content/uploads/2017/04/GreenDrop_Station_Aluminum_Can_Coke-300x300.jpg",
          "https://www.tylenolprofessional.com/sites/tylenol_hcp_us/files/sample-display-image/tylenol-product-samples600x600.jpg",
        ],
        "boardWriter": "22",
        "boardTitle": "22",
        "boardContents": "22",
        "location": "서울",
        "price": 20000,
        "boardHits": 2,
        "boardCreatedTime": "2023-03-24T18:31:47.576233",
        "boardUpdatedTime": "2023-03-31T09:25:00",
      },
      {
        "id": 15,
        "image": [
          //{imageSererURL}+"/"+"100022",
          "https://greendroprecycling.com/wp-content/uploads/2017/04/GreenDrop_Station_Aluminum_Can_Coke-300x300.jpg",
          "https://www.tylenolprofessional.com/sites/tylenol_hcp_us/files/sample-display-image/tylenol-product-samples600x600.jpg",
        ],
        "boardWriter": "test123",
        "boardTitle": "안녕하세요",
        "boardContents": "ㅇㅇㅇ",
        "location": "강남",
        "price": 25000,
        "boardHits": 7,
        "boardCreatedTime": "2023-03-28T19:32:48.417641",
        "boardUpdatedTime": "2023-03-31T09:25:00",
      },
      {
        "id": 16,
        "image": [
          "https://greendroprecycling.com/wp-content/uploads/2017/04/GreenDrop_Station_Aluminum_Can_Pepsi-300x300.jpg",
          "https://greendroprecycling.com/wp-content/uploads/2017/04/GreenDrop_Station_Aluminum_Can_Coke-300x300.jpg",
          "https://www.tylenolprofessional.com/sites/tylenol_hcp_us/files/sample-display-image/tylenol-product-samples600x600.jpg",
        ],
        "boardWriter": "input",
        "boardTitle": "test",
        "boardContents": "슈퍼 해머드릴",
        "location": "부천시 경인로",
        "price": 120000,
        "boardHits": 10,
        "boardCreatedTime": "2023-03-28T10:59:10.492566",
        "boardUpdatedTime": "2023-03-31T09:25:00",
      }
    ],
  };
  //String serverURL = "https://ubuntu.i4624.tk/image/imageid/";
  void jsonToData() {
    for (var i = 0; i < data.length; i++) {
      var item = data[i];
      //datas[item['image']] = serverURL + item['image'];
      if (datas[item['boardCategory']] == null) {
        datas[item['boardCategory']] = [item];
      } else {
        datas[item['boardCategory']]!.add(item);
      }
    }
  }

  Future<List<Map<String, dynamic>>> loadData() async {
    var url = Uri.parse('https://ubuntu.i4624.tk/boardapi/boardlist');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> responseData =
          jsonDecode(utf8.decode(response.bodyBytes));
      data = responseData
          .map((dynamic item) => Map<String, dynamic>.from(item))
          .toList();
      //jsonToData();
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Map<String, dynamic>>> loadContentsFromLocation(
      String location) async {
    //await loadData();
    //jsonToData();
    return datas[location]!;
  }
}
