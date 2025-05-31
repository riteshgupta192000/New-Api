import 'package:dio/dio.dart';
import '../models/news_model.dart';
import '../constants/constants.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<NewsModel>> fetchNews(String category) async {
    try {
      final response = await _dio.get(
        '${Constants.baseUrl}/top-headlines',
        queryParameters: {
          'country': 'us',
          'category': category.toLowerCase(),
          'apiKey': Constants.apiKey,
        },
      );
      if (response.statusCode == 200) {
        final List articles = response.data['articles'];
        return articles.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}