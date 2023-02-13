// // ignore: file_names
// // ignore: file_names
// // ignore: file_names
// // ignore: file_names
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, duplicate_ignore, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter/material.dart';
import 'package:news_app/homepage.dart';
import 'package:news_app/material/apiservice.dart';
import 'package:news_app/category_news.dart';
import 'package:news_app/news_page.dart';
import 'package:share/share.dart';

// ignore: use_key_in_widget_constructors
class HomeAPI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeAPIState();
  }
}

class HomeAPIState extends State<HomeAPI> {
  @override
  void initState() {
    super.initState();
    getData();
    getTopNews();
    getNavigation();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isloading = true;
      });
    });
  }

  var news;
  var topNews;

  bool isloading = false;

  void getData() async {
    news = await newsData();
  }

  void getTopNews() async {
    topNews = await topNewsData();
  }

  void getNavigation() async {
    navigation_category = await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return isloading == false
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Color.fromARGB(255, 207, 200, 200),
            body: SingleChildScrollView(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Card(
                    margin: EdgeInsets.symmetric(vertical: 5),

                    // borderOnForeground: true,
                    elevation: 5,
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                          // height: 1,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800)),
                      itemCount: 2,
                      itemBuilder: (BuildContext context, k, realIndex) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => News(
                                      urlToImage:
                                          topNews[k]["blog_image"].toString(),
                                      title:
                                          topNews[k]["blog_title"].toString(),
                                      description:
                                          topNews[k]["blog_dsc"].toString(),
                                      content: topNews[k]["content"].toString(),
                                      publishedAt: topNews[k]["publishedAt"]
                                          .toString())));
                            },
                            child: topNews == []
                                ? CircularProgressIndicator(
                                    strokeWidth: 10,
                                  )
                                : SizedBox(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'http://192.168.0.99:4500/${topNews[k]["blog_image"].toString()}'),
                                              fit: BoxFit.fill),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    ),
                                  ),
                          ),
                        );
                      },
                    )),
              ),
              for (var i = 0; i < navigation_category.length; i++)
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Card(
                        elevation: 5,
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: InkWell(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${navigation_category[i]['category_name']}',
                                        style: TextStyle(
                                            fontSize: 25,
                                            color:
                                                Color.fromARGB(255, 195, 9, 3)),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      appBarValue = 10;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CategoryNews(
                                            categoryName:
                                                ('${navigation_category[i]['category_name']}'),
                                            categoryId:
                                                ('${navigation_category[i]['category_id']}'),
                                          ),
                                        ));
                                  },
                                )),
                          ),
                          // getDategoryNewsData(navigation_category[i]['category_id']),

                          for (var j = 0; j < news.length; j++) ...[
                            if (navigation_category[i]['category_id'] ==
                                news[j]['category_id']) ...[
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
                                child: Column(
                                  children: [
                                    Container(
                                      height: 120,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                              width: 0.5,
                                              color: Color.fromARGB(
                                                  255, 128, 128, 128)),
                                          bottom: BorderSide(
                                              width: 0.2,
                                              color: Color.fromARGB(
                                                  255, 128, 128, 128)),
                                        ),
                                      ),
                                      // margin: EdgeInsets.all(5.0),
                                      padding: EdgeInsets.only(
                                          left: 5, top: 12, bottom: 12),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(right: 3),
                                            // width: MediaQuery.of(context).size.width * 0.35,
                                            child: news == []
                                                ? CircularProgressIndicator(
                                                    strokeWidth: 10,
                                                  )
                                                : SizedBox(
                                                    height: 100,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.30,
                                                    child: Image.network(
                                                      "http://192.168.0.99:4500/${news[j]["blog_image"].toString()}"
                                                          .toString(),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          // ignore: avoid_unnecessary_containers
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.60,
                                                child: news == []
                                                    ? CircularProgressIndicator()
                                                    : Text(
                                                        news[j]["blog_title"]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        maxLines: 2,
                                                      ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.60,
                                                child: news == []
                                                    ? CircularProgressIndicator()
                                                    : Text(
                                                        news[j]["blog_dsc"]
                                                            .toString(),
                                                        maxLines: 2,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 0),
                                                child: LikeButton(
                                                  size: 25,
                                                  circleColor: CircleColor(
                                                      start: Color.fromARGB(
                                                          255, 119, 247, 0),
                                                      end: Color.fromARGB(
                                                          255, 0, 197, 164)),
                                                  bubblesColor: BubblesColor(
                                                      dotPrimaryColor:
                                                          Color.fromARGB(
                                                              255, 255, 0, 0),
                                                      dotSecondaryColor:
                                                          Color.fromARGB(255, 0,
                                                              195, 255)),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  'Like',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              )
                                            ],
                                          ),
                                          InkWell(
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(right: 2),
                                                  child: Icon(
                                                    Icons.share,
                                                    size: 23,
                                                    color: Color.fromARGB(
                                                        255, 116, 116, 116),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text('Share'),
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              Share.share("Text");
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]
                          ]
                        ])))
            ])));
  }
}
