import 'package:flutter/material.dart';

class ArtworkDetailPage extends StatefulWidget {
  final String title;
  final String contents;
  final String imageUrl;
  final int index;

  ArtworkDetailPage({
    required this.title,
    required this.contents,
    required this.imageUrl,
    required this.index,
  });

  @override
  _ArtworkDetailPageState createState() => _ArtworkDetailPageState();
}

class _ArtworkDetailPageState extends State<ArtworkDetailPage> {
  bool isLiked = false;
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artwork Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 500.0,
              height: 500.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: 'NanumGothicBold',
                color: Color(0xFF1D1D1D),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.contents,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'NanumGothicRegular',
                  color: Color(0xFF707070),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Text(
            //   'Index: ${widget.index}',
            //   style: TextStyle(
            //     fontSize: 16.0,
            //     fontFamily: 'NanumGothicRegular',
            //     color: Color(0xFF707070),
            //   ),
            // ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                        if (isLiked) {
                          likeCount++;
                        } else {
                          likeCount--;
                        }
                      });
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '$likeCount',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'NanumGothicRegular',
                    color: Color(0xFF707070),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}