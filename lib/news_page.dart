import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:like_button/like_button.dart';
import 'package:share/share.dart';

// ignore: must_be_immutable
class News extends StatefulWidget {
  String urlToImage;
  String title;
  String description;
  String content;
  String publishedAt;
  News({
    super.key,
    required this.title,
    required this.urlToImage,
    required this.description,
    required this.content,
    required this.publishedAt,
  });
  @override
  State<StatefulWidget> createState() {
    return NewsState();
  }
}

class NewsState extends State<News> {
  // int count = 0;
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.

  //     count++;
  //   });
  // }

  List data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            foregroundColor: const Color(0xFF6B6B6B),
            onPressed: () {
              // _incrementCounter();
            },
            // ignore: sort_child_properties_last
            child: const LikeButton(
              size: 40,
              circleColor: CircleColor(
                  start: Color.fromARGB(255, 119, 247, 0),
                  end: Color.fromARGB(255, 0, 197, 164)),
              bubblesColor: BubblesColor(
                  dotPrimaryColor: Color.fromARGB(255, 255, 0, 0),
                  dotSecondaryColor: Color.fromARGB(255, 0, 195, 255)),
            ),
            elevation: 0,
          ),
          const SizedBox(
            height: 2,
          ),
          InkWell(
            onTap: () {
              setState(() {
                // Colors.redAccent;
              });
            },
            child: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              foregroundColor: const Color.fromARGB(255, 116, 116, 116),
              onPressed: () {
                Share.share("text");
              },
              // ignore: sort_child_properties_last
              child: const Icon(
                Icons.share,
                size: 35,
              ),
              elevation: 0,
            ),
          )
        ],
      ),
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 195, 9, 3), //change your color here
          ),
          centerTitle: true,
          toolbarHeight: 55,
          backgroundColor: const Color.fromARGB(198, 255, 255, 255),
          title: const Text(
            'यश भारत',
            style: TextStyle(
                fontSize: 35,
                color: Color.fromARGB(255, 195, 9, 3),
                fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                // margin: EdgeInsets.only(top: 25),
                padding: const EdgeInsets.all(5),
                child: data == []
                    ? const CircularProgressIndicator()
                    : Text(
                        widget.title.toString(),
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 195, 9, 3)),
                      ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                top: BorderSide(width: 1, color: Colors.black),
                bottom: BorderSide(width: 1, color: Colors.black),
              )),
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              // margin: EdgeInsets.only(top: 24),
              child: data == []
                  ? const CircularProgressIndicator()
                  : Image.network(
                      "${dotenv.env["FILE_URL"]}${widget.urlToImage.toString()}"),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                // margin: EdgeInsets.only(top: 25),
                padding: const EdgeInsets.only(top: 2, left: 5),
                // ignore: unnecessary_null_comparison
                child: widget.publishedAt.toString() == null
                    ? const Text('--')
                    : Text(
                        widget.publishedAt.toString(),
                        style: const TextStyle(
                            fontSize: 12, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: data == []
                  ? const CircularProgressIndicator()
                  : Text(
                      widget.description.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: data == []
                  ? const CircularProgressIndicator()
                  : Text(widget.content.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
