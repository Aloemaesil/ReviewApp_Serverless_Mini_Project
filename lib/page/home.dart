import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_project/page/detail.dart';
import 'package:test_project/repository/contents_repository.dart';

class Home extends StatefulWidget {
  Home({super.key});
  final oCcy = NumberFormat(
    "#,###",
    "ko_KR",
  );
  String calcStringToWon(String priceString) {
    return "${oCcy.format(int.parse(priceString))}원";
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String currentLocation;
  final TextEditingController _textEditingController = TextEditingController();

  //앱 내에서 좌측 상단바 출력을 위한 데이터
  final Map<String, String> optionsTypeToString = {
    "sell": "판매",
    "buy": "구매",
    "rental": "대여",
  };
  late bool isLoading;

  String productCategoryCurrentLocation = "default";
  String categoryCurrentLocation = "default";

  // 카테고리 선택
  final Map<String, dynamic> productCategoryOptionsTypeToString = {
    "default": "카테고리",
    "electronics": "디지털/가전",
    "tools": "공구",
    "clothes": "의류",
    "others": "기타"
  };

  // 거래방식 선택
  final Map<String, dynamic> categoryOptionsTypeToString = {
    "default": "별점",
    "sell": "판매",
    "buy": "구매",
    "rental": "대여",
  };

  @override
  void initState() {
    super.initState();
    currentLocation = "sell";
    isLoading = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  // 원화 계산 라이브러리 & 원화 계산 함수
  final oCcy = NumberFormat(
    "#,###",
    "ko_KR",
  );
  String calcStringToWon(String priceString) {
    return "${oCcy.format(int.parse(priceString))}원";
  }

  // currentLocation으로 판매, 구매, 대여 페이지 선택
  Future<List<Map<String, dynamic>>> _loadContents() async {
    List<Map<String, dynamic>> responseData =
        await ContentsRepository().loadContentsFromLocation(currentLocation);
    return responseData;
  }

  Widget _makeDataList(List<Map<String, dynamic>>? datas) {
    int size = datas == null ? 0 : datas.length;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (BuildContext context, int index) {
        if (datas[index]["image"].isEmpty) {
          datas[index]["image"] = ["assets/images/No_image.jpg"];
        }
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return DetailContentView(data: datas[index]);
                },
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Image.network(
                    datas[index]["image"][0],
                    width: 200,
                    height: 200,
                    scale: 1,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        "assets/images/No_image.jpg",
                        width: 200,
                        height: 200,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          datas[index]["boardTitle"]!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'GmarketSans',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          datas[index]["location"]!,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          calcStringToWon(datas[index]["price"].toString()),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Color.fromARGB(255, 64, 64, 64),
                                size: 27,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                //datas[index]["like"].toString(),
                                datas[index]["boardHits"].toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: datas!.length, // 상품 목록의 개수
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 1,
          color: Colors.black.withOpacity(0.4),
        );
      },
    );
  }

  // 제품 목록을 보여주는 body //원본 코드
  Widget _bodyWidget() {
    return FutureBuilder(
      future: _loadContents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("데이터를 불러올 수 없습니다."));
        }
        if (snapshot.hasData) {
          return Expanded(
            child: _makeDataList(snapshot.data),
          );
        }
        return const Center(child: Text("해당 거래방식에 대한 데이터가 없습니다."));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appBar: _appbarWidget(),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: Column(
            children: [
              Material(
                // Add Material widget here
                elevation: 1, // Adjust the elevation value as needed
                child: SizedBox(
                  height: 125,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            //color: Colors.blueAccent,
                            ),
                      ),
                      Container(
                        width: 150,
                        color: Colors.amberAccent,
                        child: Center(child: Text("이미지")),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                            //color: Colors.limeAccent,
                            ),
                      ),
                      Flexible(
                        flex: 5,
                        child: SizedBox(
                          child: TextFormField(
                            controller: _textEditingController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                            onFieldSubmitted: (value) {},
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                            //color: Colors.amberAccent,
                            ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "로그인",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 110, 110, 110)),
                        ),
                      ),
                      const Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Image(
                            image: AssetImage('assets/images/user.png'),
                            width: 50,
                            height: 50,
                          )
                          // Container(
                          //   color: Colors.blueAccent,
                          // ),
                          ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                //color: Color.fromARGB(255, 254, 177, 177),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: GestureDetector(
                        onTap: () {
                          print("click event");
                        },
                        child: PopupMenuButton<String>(
                          offset: const Offset(0, 30),
                          shape: ShapeBorder.lerp(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              1),
                          onSelected: (String value) {
                            setState(() {
                              categoryCurrentLocation = value;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              const PopupMenuItem(
                                value: "sell",
                                child: Text("판매"),
                              ),
                              const PopupMenuItem(
                                value: "buy",
                                child: Text("구매"),
                              ),
                              const PopupMenuItem(
                                value: "rental",
                                child: Text("대여"),
                              ),
                            ];
                          },
                          //좌측 상단 판매, 구매, 대여 선택바
                          child: SizedBox(
                            width: 120,
                            child: Row(
                              children: [
                                //앱 내에서 좌측 상단바 출력을 위한 데이터
                                Text(
                                  categoryOptionsTypeToString[
                                      categoryCurrentLocation]!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: GestureDetector(
                        child: PopupMenuButton<String>(
                          offset: const Offset(0, 30),
                          shape: ShapeBorder.lerp(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              1),
                          onSelected: (String value) {
                            setState(() {
                              productCategoryCurrentLocation = value;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              const PopupMenuItem(
                                value: "electronics",
                                child: Text("디지털/가전"),
                              ),
                              const PopupMenuItem(
                                value: "tools",
                                child: Text("공구"),
                              ),
                              const PopupMenuItem(
                                value: "clothes",
                                child: Text("의류"),
                              ),
                              const PopupMenuItem(
                                value: "others",
                                child: Text("기타"),
                              ),
                            ];
                          },
                          //좌측 상단 판매, 구매, 대여 선택바
                          child: SizedBox(
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //앱 내에서 좌측 상단바 출력을 위한 데이터
                                Text(
                                  productCategoryOptionsTypeToString[
                                      productCategoryCurrentLocation]!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 150,
                    ),
                    _bodyWidget(),
                    Container(
                      width: 150,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              print('이미지 추가');
              //_selectImage();
            },
            backgroundColor: const Color.fromARGB(255, 200, 200, 200),
            label: const Text(
              "게시글 작성",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
