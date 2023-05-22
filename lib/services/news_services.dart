import 'package:dio/dio.dart';
import 'package:news_app/constants/constants.dart';

class NewService {
  final Dio _dio = Dio(
      BaseOptions(baseUrl: APIUrls.baseUrl, responseType: ResponseType.json));

  fetchNews() async {
    var response = await _dio.get('&language=en');

    return response.data;
  }

  bySearching(String title) async {
    var response = await _dio.get('&language=en&q=' + title);
    return response.data;
  }
}
