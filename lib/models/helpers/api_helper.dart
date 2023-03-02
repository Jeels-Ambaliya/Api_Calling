import 'dart:convert';

import 'package:http/http.dart' as http;

import '../posts_model.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  Future<Post?> getPost({required int PostNum}) async {
    String api = "https://jsonplaceholder.typicode.com/posts/$PostNum";
    Uri myUrl = Uri.parse(api);
    http.Response res = await http.get(myUrl);

    if (res.statusCode == 200) {
      String jsonData = res.body;
      Map data = jsonDecode(jsonData);
      Post P = Post.fromMap(data: data);
      return P;
    }
    return null;
  }

  Future<List<Post>?> getAllPost() async {
    String api = "https://jsonplaceholder.typicode.com/posts";
    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      List<dynamic> allData = jsonDecode(res.body);

      List<Post> allPost = allData
          .map(
            (e) => Post.fromMap(data: e),
          )
          .toList();

      return allPost;
    }

    return null;
  }

  Future<Map?> getWeather({required String City}) async {
    String api =
        "https://api.openweathermap.org/data/2.5/weather?q=${City}&appid=741fb99d4505b54a5f52f4b4696a0542";

    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body);
      return data;
    }
    return null;
  }
}
