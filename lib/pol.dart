// // ignore: file_names
// // ignore: file_names
// // ignore: file_names
// // ignore: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:like_button/like_button.dart';
import 'package:news_app/homepage.dart';
import 'package:share/share.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'news_page.dart';

AppBar buildAppBar(String str) {
  return appBarValue < 9
      ? AppBar(
          backgroundColor: const Color.fromARGB(0, 214, 171, 171),
          toolbarHeight: 0,
        )
      : AppBar(
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 195, 9, 3), //change your color here
          ),
          // leading: Icon(color: Colors.black),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(223, 235, 235, 235),
          // ignore: avoid_unnecessary_containers
          title: Text(
            str,
            style: const TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 195, 9, 3),
                fontWeight: FontWeight.bold),
          ),
        );
}
// import 'news_page.dart';

// ignore: must_be_immutable
class PoliticsAPI extends StatefulWidget {
  String categoryId;
  String categoryName;
  PoliticsAPI({Key? key, required this.categoryName, required this.categoryId})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return PoliticsAPIState();
  }
}

class PoliticsAPIState extends State<PoliticsAPI> {
  // ignore: prefer_typing_uninitialized_variables
  var getData;
  bool isLiked = false;
  bool isloaded = false;
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  List data = [];
// 080da2c987ba48db93233f15dab5624c
  Future<void> fetchData() async {
    var response = await http.get(Uri.parse("${dotenv.env["APP_URL"]}blogs"));

    final jsonresponse = jsonDecode(response.body);

    final finalart = jsonresponse['data'] as List;

    setState(() {
      data = finalart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < data.length; i++)
              if (widget.categoryId == data[i]['category_id'])
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(255, 128, 128, 128)),
                          bottom: BorderSide(
                              width: 0.2,
                              color: Color.fromARGB(255, 128, 128, 128)),
                        ),
                      ),
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => News(
                                      urlToImage:
                                          data[i]["blog_image"].toString(),
                                      title: data[i]["blog_title"].toString(),
                                      description:
                                          data[i]["blog_dsc"].toString(),
                                      content: data[i]["content"].toString(),
                                      publishedAt:
                                          data[i]["publishedAt"].toString())));
                            },
                            child: data == []
                                ? const CircularProgressIndicator()
                                : SizedBox(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    child: Image.network(
                                      "http://192.168.0.99:4500/${data[i]["blog_image"].toString()}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                            // : Image.network(
                            //     "http://192.168.0.99:4500/${data[i]["blog_image"].toString()}"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // ignore: avoid_unnecessary_containers
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => News(
                                                urlToImage: data[i]
                                                        ["blog_image"]
                                                    .toString(),
                                                title: data[i]["blog_title"]
                                                    .toString(),
                                                description: data[i]["blog_dsc"]
                                                    .toString(),
                                                content: data[i]
                                                        ["content"]
                                                    .toString(),
                                                publishedAt: data[i]
                                                        ["publishedAt"]
                                                    .toString())));
                                  },
                                  child: data == []
                                      ? const CircularProgressIndicator()
                                      : Text(
                                          data[i]["blog_title"].toString(),
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: const EdgeInsets.all(0),
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => News(
                                                urlToImage: data[i]
                                                        ["blog_image"]
                                                    .toString(),
                                                title: data[i]["blog_title"]
                                                    .toString(),
                                                description: data[i]["blog_dsc"]
                                                    .toString(),
                                                content: data[i]
                                                        ["content"]
                                                    .toString(),
                                                publishedAt: data[i]
                                                        ["publishedAt"]
                                                    .toString())));
                                  },
                                  child: data == []
                                      ? const CircularProgressIndicator()
                                      : Text(
                                          data[i]["blog_dsc"].toString(),
                                          maxLines: 2,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 0),
                                child: const LikeButton(
                                  size: 25,
                                  circleColor: CircleColor(
                                      start: Color.fromARGB(255, 119, 247, 0),
                                      end: Color.fromARGB(255, 0, 197, 164)),
                                  bubblesColor: BubblesColor(
                                      dotPrimaryColor:
                                          Color.fromARGB(255, 255, 0, 0),
                                      dotSecondaryColor:
                                          Color.fromARGB(255, 0, 195, 255)),
                                ),
                              ),
                              // ignore: avoid_unnecessary_containers
                              Container(
                                child: const Text(
                                  'Like',
                                  style: TextStyle(fontSize: 15),
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 2),
                                  child: const Icon(
                                    Icons.share,
                                    size: 23,
                                    color: Color.fromARGB(255, 116, 116, 116),
                                  ),
                                ),
                                // ignore: avoid_unnecessary_containers
                                Container(
                                  child: const Text('Share'),
                                ),
                              ],
                            ),
                            onTap: () {
                              Share.share("");
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
