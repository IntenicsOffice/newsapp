// ignore: unnecessary_import
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// ignore: must_be_immutable
class NewsPaper extends StatefulWidget {
  String date;
  String selectedDate;
  String pdf;
  NewsPaper(
      {super.key,
      required this.date,
      required this.pdf,
      required this.selectedDate});

  @override
  State<NewsPaper> createState() => _NewsPaperState();
}

class _NewsPaperState extends State<NewsPaper> {
  var timer;
  var pdfFile;
  bool isloading = false;
  // TextEditingController dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // fetchData();
    // Future.delayed(Duration(seconds: 1), () {
    //   setState(() {
    //     isloading = true;
    //   });
    // });
    // timer = Timer.periodic(
    //     const Duration(seconds: 3),
    //     (Timer t) => setState(() {
    //           isloading = true;
    //         }));
  }

  // Future<dynamic> fetchData() async {
  //   var response =
  //       await http.get(Uri.parse("${dotenv.env["APP_URL"]}upload-pdf"));

  //   final jsonresponse = jsonDecode(response.body);

  //   final finalart = jsonresponse['data'];

  //   pdfFile = finalart;
  //   print("$pdfFile=====");
  // }

  var i;

  // ignore: prefer_final_fields
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 195, 9, 3),
          ),
        ),
        // iconTheme: const IconThemeData(
        //   color: Color.fromARGB(255, 195, 9, 3), //change your color here
        // ),
        centerTitle: true,
        toolbarHeight: 55,
        backgroundColor: const Color.fromARGB(198, 255, 255, 255),
        title: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'यश भारत',
              style: TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(255, 195, 9, 3),
                  fontWeight: FontWeight.bold),
            )),
        elevation: 2,
      ),
      body: Center(
        // child: SingleChildScrollView(
        child:
            // Column(
            //   children: [
            // for (var i = 0; i < pdfFile.length; i++)
            //   if (pdfFile != null
            //       ? widget.selectedDate == pdfFile[i]['date']
            //       : false) ...[
            //     SfPdfViewer.network(
            //       '${dotenv.env["FILE_URL"]}${pdfFile[i]['upload_pdf_files']}',
            //       scrollDirection: PdfScrollDirection.horizontal,
            //       initialZoomLevel: 1,
            //       canShowScrollHead: false,
            //       pageLayoutMode: PdfPageLayoutMode.single,
            //     ),
            //   ] else
            // if (widget.date != null) ...[
            SfPdfViewer.network(
          '${dotenv.env["FILE_URL"]}${widget.pdf.toString()}',
          scrollDirection: PdfScrollDirection.horizontal,
          initialZoomLevel: 1,
          canShowScrollHead: false,
          pageLayoutMode: PdfPageLayoutMode.single,
        ),
        //   ] else ...[
        //     Text("Please Select date")
        //   ]
        // ],
        // ),
        // )
      ),
    );
  }
}
//http://192.168.0.99:4500/uploads//1667801669863_410095006.pdf