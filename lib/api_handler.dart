import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qlkhohangapp/model.dart';

class ApiHandler {
  final String baseUrl = "http://10.0.2.2:5084/api/Blog/Get";

  Future<List<Blog>> getBlogData() async {
    List<Blog> data = [];
    final uri = Uri.parse(baseUrl);
    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final List<dynamic> jsonData = json.decode(response.body);
        data = jsonData.map((json) => Blog.fromJson(json)).toList();
        print('Data fetched successfully: $data'); // Log kiểm tra dữ liệu
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
    return data;
  }
}
