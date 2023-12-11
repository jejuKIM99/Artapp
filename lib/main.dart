import 'package:flutter/material.dart';
import 'artwork_detail_page.dart';
import 'BottomBar.dart'; // BottomBar 파일 임포트

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.deepPurple.shade100],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. 텍스트 영역
              Container(
                margin: EdgeInsets.only(top: 50.0, left: 20.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Explore the most popular artworks',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'NanumGothicExtraBold',
                    color: Color(0xFF1D1D1D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              // 2. 사진 슬라이더 영역
              Container(
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildImageCard('img/main_1.jpg'),
                    SizedBox(width: 30.0),
                    _buildImageCard('img/main_2.jpg'),
                    SizedBox(width: 30.0),
                    _buildImageCard('img/main_3.jpg'),
                  ],
                ),
              ),

              // 3. 텍스트 영역 (New Artworks)
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'New Artworks',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'NanumGothicExtraBold',
                    color: Color(0xFF1D1D1D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              // 4. 슬라이더 영역 내 요소 (카드 3개)
              Container(
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildArtworkCard('Title 1', 'Contents 1', 1, context),
                    SizedBox(width: 30.0),
                    _buildArtworkCard('Title 2', 'Contents 2', 2, context),
                    SizedBox(width: 30.0),
                    _buildArtworkCard('Title 3', 'Contents 3', 3, context),
                  ],
                ),
              ),

              // 5. 카테고리 영역
              Container(
                margin: EdgeInsets.only(left: 20.0, top: 20.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Categorise',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'NanumGothicExtraBold',
                    color: Color(0xFF1D1D1D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // 6. 카테고리 카드들
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 30.0,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    String imagePath = 'img/categories_${index + 1}.jpg';
                    return _buildCategoryCard(imagePath);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // 여기서부터는 BottomBar 추가
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget _buildArtworkCard(String title, String contents, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArtworkDetailPage(
              title: title,
              contents: contents,
              index: index,
              imageUrl: _buildImagePath(index), // imageUrl 추가
            ),
          ),
        );
      },
      child: Container(
        width: 410.0,
        height: 180.0,
        margin: EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
          ),
          color: Color(0xFFF3F3F3),
        ),
        child: Row(
          children: [
            Container(
              width: 160.0,
              height: 180.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Image.asset(
                  _buildImagePath(index),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'NanumGothicBold',
                      color: Color(0xFF1D1D1D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    contents,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'NanumGothicRegular',
                      color: Color(0xFF707070),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCard(String imagePath) {
    return Container(
      width: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0.0, 10.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String imagePath) {
    return Container(
      width: 180.0,
      height: 130.0,
      margin: EdgeInsets.only(bottom: 30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xFFF3F3F3),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  String _buildImagePath(int index) {
    return 'assets/img/new_$index.jpg';
  }
}
