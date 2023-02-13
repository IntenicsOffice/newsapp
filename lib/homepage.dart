// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/material/apiservice.dart';

import 'package:news_app/api.dart';
import 'package:news_app/pol.dart';
import 'package:http/http.dart' as http;

int appBarValue = 0;
var navigation_category;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    //fetch data from API
    fetchData();
    topNewsData();
    newsData();
  }

  Future<void> fetchData() async {
    var res = await http.get(Uri.parse("${dotenv.env["APP_URL"]}navigation"));

    final jsonresponse = jsonDecode(res.body);
    final response = jsonresponse['data'] as List;

    setState(() {
      navigation_category = response;
    });
  }

  int index = 0;
  var i;
  @override
  Widget build(BuildContext context) {
    return navigation_category == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : DefaultTabController(
            length: navigation_category.length + 1,
            child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              appBar: AppBar(
                centerTitle: true,
                toolbarHeight: 55,
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                // ignore: avoid_unnecessary_containers
                title: const Padding(
                    padding: EdgeInsets.only(top: 10, left: 8.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'यश भारत',
                        style: TextStyle(
                            fontSize: 35,
                            color: Color.fromARGB(255, 195, 9, 3),
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(30.0),
                  child: TabBar(
                    isScrollable: true,
                    padding: const EdgeInsets.only(top: 0, left: 0, bottom: 0),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: const Color.fromARGB(255, 195, 9, 3),
                    labelColor: const Color.fromARGB(255, 195, 9, 3),
                    automaticIndicatorColorAdjustment: true,
                    unselectedLabelColor: const Color.fromARGB(255, 0, 0, 0),
                    // .withOpacity(0.8),
                    tabs: [
                      const Tab(
                        text: "मुख्य खबरें",
                      ),
                      for (var i = 0; i < navigation_category.length; i++)
                        Tab(
                          text: navigation_category[i]['category_name'],
                        ),
                    ],
                    onTap: (index) {
                      setState(() {
                        appBarValue = index;

                        // print(appBarValue);
                      });
                    },
                  ),
                ),
                elevation: 5,
              ),
              body: TabBarView(children: [
                HomeAPI(),
                for (var i = 0; i < navigation_category.length; i++)
                  PoliticsAPI(
                    categoryId: navigation_category[i]['category_id'],
                    categoryName: navigation_category[i]['category_name'],
                  ),
                // BusinessAPI(),
                // DeshAPI(),
                // VideshAPI(),
                // AstrologyAPI(),
                // BollywoodAPI(),
                // SportsAPI(),
                // EditorsAPI(),
              ]),
            ),
          );
  }
}
