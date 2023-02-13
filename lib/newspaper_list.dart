// ignore_for_file: prefer_typing_uninitialized_variables, duplicate_ignore

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/enews_paper.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

TextEditingController dateController = TextEditingController();

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  bool isTap = false;
  bool isDateTap = false;
  // ignore: prefer_typing_uninitialized_variables
  var newsPdf;
  var newsDate;
  var newsPaper;
  @override
  void initState() {
    super.initState();
    // pdfNewsData();

    dateController.text = "";
    fetchData();
  }

  // ignore: prefer_typing_uninitialized_variables
  var pdfData;
  Future<void> fetchData() async {
    // if (isDateTap == true) {
    var response = await http.get(
        Uri.parse("${dotenv.env["APP_URL"]}upload-pdf/${dateController.text}"));

    final jsonresponse = jsonDecode(response.body);

    final finalart = jsonresponse['data'] as List;

    setState(() {
      pdfData = finalart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return pdfData == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return Center(
                              child: AlertDialog(
                                title: const Text("Select Date"),
                                content: TextField(
                                  controller:
                                      dateController, //editing controller of this TextField
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons
                                          .calendar_today), //icon of text field
                                      labelText:
                                          "Select Date" //label text of field
                                      ),

                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate:
                                            DateTime.now(), //get today's date
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));
                                    if (pickedDate != null) {
                                      String formattedDate =
                                          DateFormat("yyyy-MM-dd")
                                              .format(pickedDate);
                                      setState(() {
                                        dateController.text =
                                            formattedDate.toString();
                                      });
                                    } else {
                                      const Text('Please select date');
                                    }
                                  },
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        dateController.text;
                                        fetchData();
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Confirm'))
                                ],
                              ),
                            );
                          }));
                    },
                    icon: const Icon(
                      Icons.calendar_month,
                      color: Color.fromARGB(255, 195, 9, 3),
                      size: 30,
                    ))
              ],
              centerTitle: true,
              toolbarHeight: 55,
              backgroundColor: const Color.fromARGB(198, 255, 255, 255),
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
              elevation: 2,
            ),
            body: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var i = 0; i < pdfData.length; i++)
                    Center(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isTap = true;
                            newsPdf = pdfData[i]['upload_pdf_files'].toString();
                          });

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NewsPaper(
                                  selectedDate: '',
                                  date: pdfData[i]['date'].toString(),
                                  pdf: pdfData[i]['upload_pdf_files']
                                      .toString())));
                        },
                        child: Card(
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Image.asset(
                                            'assets/images/news.png'))),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(50),
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    ),
                                    color: const Color.fromARGB(
                                        255, 219, 219, 219),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Text(
                                          pdfData[i]['date'],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                    )
                ],
              ),
            ),
          );
  }
}

// class NewsPaper extends StatefulWidget {
//   String date;
//   String selectedDate;
//   String pdf;
//   NewsPaper(
//       {super.key,
//       required this.date,
//       required this.pdf,
//       required this.selectedDate});

//   @override
//   State<NewsPaper> createState() => _NewsPaperState();
// }

// class _NewsPaperState extends State<NewsPaper> {
//   var timer;
//   var pdfFile;
//   bool isloading = false;
//   @override
//   void initState() {
//     super.initState();
//   }

//   var i;

//   // ignore: prefer_final_fields
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         toolbarHeight: 55,
//         backgroundColor: const Color.fromARGB(198, 255, 255, 255),
//         title: const Padding(
//             padding: EdgeInsets.only(top: 10),
//             child: Text(
//               'यश भारत',
//               style: TextStyle(
//                   fontSize: 35,
//                   color: Color.fromARGB(255, 195, 9, 3),
//                   fontWeight: FontWeight.bold),
//             )),
//         elevation: 2,
//       ),
//       body: Center(
//         child: SfPdfViewer.network(
//           '${dotenv.env["FILE_URL"]}${widget.pdf.toString()}',
//           scrollDirection: PdfScrollDirection.horizontal,
//           initialZoomLevel: 1,
//           canShowScrollHead: false,
//           pageLayoutMode: PdfPageLayoutMode.single,
//         ),
//       ),
//     );
//   }
// }
