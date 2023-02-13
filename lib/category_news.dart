// // // ignore_for_file: avoid_unnecessary_containers

// // ignore_for_file: avoid_print, duplicate_ignore, prefer_const_constructors

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:like_button/like_button.dart';
// import 'package:news_app/material/apiservice.dart';
// import 'package:news_app/pol.dart';
// import 'package:share/share.dart';

// import 'news_page.dart';

// // ignore: use_key_in_widget_constructors
// class NewPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return NewPageState();
//   }
// }

// class NewPageState extends State<NewPage> {
//   // ignore: prefer_typing_uninitialized_variables

//   bool isloaded = false;
//   @override
//   void initState() {
//     super.initState();

//     //fetch news from API
//     getnews();
//   }

//   var news = [];
// // 080da2c987ba48db93233f15dab5624c
//   void getnews() async {
//     news = await newsnews();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar('str'),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             for (var i = 0; i < news.length; i++)
//               Column(
//                 children: [
//                   Container(
//                     decoration: const BoxDecoration(
//                       border: Border(
//                         top: BorderSide(
//                             width: 0.5,
//                             color: Color.fromARGB(255, 128, 128, 128)),
//                         bottom: BorderSide(
//                             width: 0.5,
//                             color: Color.fromARGB(255, 128, 128, 128)),
//                       ),
//                     ),
//                     margin: EdgeInsets.all(5.0),
//                     padding: EdgeInsets.all(5.0),
//                     child: Row(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(right: 3),
//                           height: 80.0,
//                           width: MediaQuery.of(context).size.width * 0.25,
//                           child: InkWell(
//                             onTap: () {
//                               // Navigator.of(context).push(MaterialPageRoute(
//                               //     builder: (context) => News(
//                               //         urlToImage:
//                               //             news[i]["urlToImage"].toString(),
//                               //         title: news[i]["title"].toString(),
//                               //         description:
//                               //             news[i]["description"].toString(),
//                               //         content: news[i]["content"].toString(),
//                               //         publishedAt:
//                               //             news[i]["publishedAt"].toString())));
//                             },
//                             child: news == []
//                                 ? CircularProgressIndicator()
//                                 : Image.network(
//                                     "http://192.168.0.99:4500/${news[i]["blog_image"].toString()}"),
//                           ),
//                         ),

//                         // ignore: avoid_unnecessary_containers
//                         Column(
//                           children: [
//                             Container(
//                               width: MediaQuery.of(context).size.width * 0.69,
//                               padding: EdgeInsets.all(3),
//                               height: 50.0,
//                               child: InkWell(
//                                 onTap: () {
//                                   // Navigator.of(context).push(MaterialPageRoute(
//                                   //     builder: (context) => News(
//                                   //         urlToImage:
//                                   //             news[i]["urlToImage"].toString(),
//                                   //         title: news[i]["title"].toString(),
//                                   //         description:
//                                   //             news[i]["description"].toString(),
//                                   //         content:
//                                   //             news[i]["content"].toString(),
//                                   //         publishedAt: news[i]["publishedAt"]
//                                   //             .toString())));
//                                 },
//                                 child: news == []
//                                     ? CircularProgressIndicator()
//                                     : Text(
//                                         news[i]["blog_title"].toString(),
//                                         style: TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.all(0),
//                               height: 70.0,
//                               width: MediaQuery.of(context).size.width * 0.69,
//                               child: InkWell(
//                                 onTap: () {
//                                   // Navigator.of(context).push(MaterialPageRoute(
//                                   //     builder: (context) => News(
//                                   //         urlToImage:
//                                   //             news[i]["urlToImage"].toString(),
//                                   //         title: news[i]["title"].toString(),
//                                   //         description:
//                                   //             news[i]["description"].toString(),
//                                   //         content:
//                                   //             news[i]["content"].toString(),
//                                   //         publishedAt: news[i]["publishedAt"]
//                                   //             .toString())));
//                                 },
//                                 child: news == []
//                                     ? CircularProgressIndicator()
//                                     : Text(news[i]["blog_dsc"].toString()),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               padding: EdgeInsets.only(left: 0),
//                               child: LikeButton(
//                                 size: 25,
//                                 circleColor: CircleColor(
//                                     start: Color.fromARGB(255, 119, 247, 0),
//                                     end: Color.fromARGB(255, 0, 197, 164)),
//                                 bubblesColor: BubblesColor(
//                                     dotPrimaryColor:
//                                         Color.fromARGB(255, 255, 0, 0),
//                                     dotSecondaryColor:
//                                         Color.fromARGB(255, 0, 195, 255)),
//                               ),
//                             ),
//                             Text(
//                               'Like',
//                               style: TextStyle(fontSize: 15),
//                             )
//                           ],
//                         ),
//                         InkWell(
//                           child: Row(
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.only(right: 2),
//                                 child: Icon(
//                                   Icons.share,
//                                   size: 23,
//                                   color: Color.fromARGB(255, 116, 116, 116),
//                                 ),
//                               ),
//                               Text('Share'),
//                             ],
//                           ),
//                           onTap: () {
//                             Share.share("Text");
//                           },
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/////
// String categoryName;
// String categoryId;
// NewPage({super.key, required this.categoryName, required this.categoryId});

// NewPage(

////

// // ignore: file_names
// // ignore: file_names
// // ignore: file_names
// // ignore: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:like_button/like_button.dart';
import 'package:news_app/pol.dart';
import 'package:share/share.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'news_page.dart';

// ignore: must_be_immutable
class CategoryNews extends StatefulWidget {
  String categoryName;
  String categoryId;
  CategoryNews(
      {super.key, required this.categoryName, required this.categoryId});

  @override
  State<StatefulWidget> createState() {
    return CategoryNewsState();
  }
}

class CategoryNewsState extends State<CategoryNews> {
  // ignore: prefer_typing_uninitialized_variables
  var getnews;
  bool isLiked = false;
  bool isloaded = false;
  @override
  void initState() {
    super.initState();

    //fetch news from API
    fetchnews();
  }

  List news = [];
// 080da2c987ba48db93233f15dab5624c
  Future<void> fetchnews() async {
    var response = await http.get(Uri.parse("${dotenv.env["APP_URL"]}blogs"));

    final jsonresponse = jsonDecode(response.body);

    final finalart = jsonresponse['data'] as List;

    setState(() {
      news = finalart;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return news == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: buildAppBar(widget.categoryName),
            body: SingleChildScrollView(
              child: Column(children: [
                for (var j = 0; j < news.length; j++)
                  if (widget.categoryId == news[j]['category_id'])
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
                                              news[j]["blog_image"].toString(),
                                          title:
                                              news[j]["blog_title"].toString(),
                                          description:
                                              news[j]["blog_dsc"].toString(),
                                          content:
                                              news[j]["content"].toString(),
                                          publishedAt: news[j]["publishedAt"]
                                              .toString())));
                                },
                                child: news == []
                                    ? const CircularProgressIndicator()
                                    : SizedBox(
                                        height: 100,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.30,
                                        child: Image.network(
                                          "http://192.168.0.99:4500/${news[j]["blog_image"].toString()}",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                // : Image.network(
                                //     "http://192.168.0.99:4500/${news[i]["blog_image"].toString()}"),
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => News(
                                                    urlToImage: news[j]
                                                            ["blog_image"]
                                                        .toString(),
                                                    title: news[j]["blog_title"]
                                                        .toString(),
                                                    description: news[j]
                                                            ["blog_dsc"]
                                                        .toString(),
                                                    content: news[j]["content"]
                                                        .toString(),
                                                    publishedAt: news[j]
                                                            ["publishedAt"]
                                                        .toString())));
                                      },
                                      child: news == []
                                          ? const CircularProgressIndicator()
                                          : Text(
                                              news[j]["blog_title"].toString(),
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => News(
                                                    urlToImage: news[j]
                                                            ["blog_image"]
                                                        .toString(),
                                                    title: news[j]["blog_title"]
                                                        .toString(),
                                                    description: news[j]
                                                            ["blog_dsc"]
                                                        .toString(),
                                                    content: news[j]["content"]
                                                        .toString(),
                                                    publishedAt: news[j]
                                                            ["publishedAt"]
                                                        .toString())));
                                      },
                                      child: news == []
                                          ? const CircularProgressIndicator()
                                          : Text(
                                              news[j]["blog_dsc"].toString(),
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
                                          start:
                                              Color.fromARGB(255, 119, 247, 0),
                                          end:
                                              Color.fromARGB(255, 0, 197, 164)),
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
                                        color:
                                            Color.fromARGB(255, 116, 116, 116),
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
              ]),
            ),
          );
  }
}
