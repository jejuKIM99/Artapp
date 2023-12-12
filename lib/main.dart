import 'package:flutter/material.dart';
import 'artwork_detail_page.dart';
import 'BottomBar.dart';

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://i.pinimg.com/originals/38/94/35/38943509776467b5b487f6d84d0e6bbd.png',
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.transparent,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    // 메뉴 아이콘을 눌렀을 때의 동작 추가
                  },
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.transparent, Colors.transparent],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.0, left: 20.0),
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
                      Container(
                        height: 200.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildImageCard(
                              'https://i.pinimg.com/originals/7f/a3/86/7fa386f2e07ddd591ea8a97b4180a763.png',
                            ),
                            SizedBox(width: 30.0),
                            _buildImageCard(
                              'https://www.thisiscolossal.com/wp-content/uploads/2023/08/ghfhj.jpg',
                            ),
                            SizedBox(width: 30.0),
                            _buildImageCard(
                              'https://artincontext.org/wp-content/uploads/2022/01/Scenery-Painting-Ideas.jpg',
                            ),
                          ],
                        ),
                      ),
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
                      Container(
                        height: 200.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildArtworkCard(
                              'Golden Hour City Center',
                              "The painting is a watercolor painting and not one I drew. It seems like a picture of a cityscape, and the unique feeling of watercolor is not necessary, and in fact, it's just to make sure that the function of the writing area is working well, so the content is not useful.",
                              'https://i0.wp.com/doodlewash.com/wp-content/uploads/2018/02/gp32.jpg?fit=1024%2C806&ssl=1',
                              context,
                              1,
                            ),
                            SizedBox(width: 30.0),
                            _buildArtworkCard(
                              "Buddha's jerky",
                              "It's a 3D model work called 'Buddhist's jerky', and it's a work that feels like the Buddha eats meat. It's a wrapping paper that makes you feel like you're a fan. But I really made this. Please believe me. If it comes out, I'm serious. Anyway, I'll just try to use this word without hesitation.",
                              'https://i.pinimg.com/originals/7e/f6/83/7ef68339866418122ec560e3196652ba.png',
                              context,
                              2,
                            ),
                            SizedBox(width: 30.0),
                            _buildArtworkCard(
                              'Half-body Angel',
                              "I don't know what else this is. I have to write something to see if it works, but I wonder if there is anyone who interprets it. If you really interpret it, you speak English well, but I want to ask you what you think about trying to get a job abroad. Anyway, I want to explain this work as a 3D model of a half-body angel, but I don't know.",
                              'https://i.redd.it/c41q6vyec9211.jpg',
                              context,
                              3,
                            ),
                          ],
                        ),
                      ),
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
            ]),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget _buildArtworkCard(String title, String contents, String imageUrl, BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArtworkDetailPage(
              title: title,
              contents: contents,
              imageUrl: imageUrl,
              index: index,
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(1.0),
                    offset: Offset(0.0, 3.0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 170.0, // 카드의 오른쪽 끝에서 10px 안쪽으로
                    child: Text(
                      title,
                      maxLines: 1, // 최대 1줄까지 보여주고 초과는 생략
                      overflow: TextOverflow.ellipsis, // 초과되는 부분은 ...
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'NanumGothicBold',
                        color: Color(0xFF1D1D1D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0), // 간격 조절
                  Container(
                    width: 170.0, // 카드의 오른쪽 끝에서 10px 안쪽으로
                    child: Text(
                      contents,
                      maxLines: 3, // 최대 3줄까지 보여주고 초과는 생략
                      overflow: TextOverflow.ellipsis, // 초과되는 부분은 ...
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'NanumGothicRegular',
                        color: Color(0xFF707070),
                      ),
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

  Widget _buildImageCard(String imageUrl) {
    return Container(
      width: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            offset: Offset(0.0, 10.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Image.network(
          imageUrl,
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0.0, 10.0),
            blurRadius: 10.0,
          ),
        ],
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
}
