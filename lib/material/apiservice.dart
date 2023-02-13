import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<dynamic> newsData() async {
  var response = await http.get(Uri.parse("${dotenv.env["APP_URL"]}blogs"));

  final jsonresponse = jsonDecode(response.body);
  final finalart = jsonresponse['data'] as List;
  return finalart;
}

Future<dynamic> fetchData() async {
  var res = await http.get(Uri.parse("${dotenv.env["APP_URL"]}navigation"));

  final jsonresponse = jsonDecode(res.body);
  final response = jsonresponse['data'] as List;

  return response;
}

Future<dynamic> topNewsData() async {
  var response = await http.get(Uri.parse("${dotenv.env["APP_URL"]}top-news"));

  final jsonresponse = jsonDecode(response.body);
  final finalart = jsonresponse['data'] as List;
  return finalart;
}

// Future<dynamic> getGategoryNews(category_id) async {
//   print(category_id);
//   var response = await http.get(Uri.parse("${dotenv.env["APP_URL"]}blogs"));

//   final jsonresponse = jsonDecode(response.body);
//   final finalart = jsonresponse['data'] as List;

//   return finalart;
// }
