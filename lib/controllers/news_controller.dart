import 'package:get/get.dart';
import '../models/news_model.dart';
import '../services/api_services.dart';

class NewsController extends GetxController {
  var newsList = <NewsModel>[].obs;
  var isLoading = false.obs;
  var selectedCategory = 'Technology'.obs;

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void setCategory(String category) {
    selectedCategory.value = category;
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      isLoading.value = true;
      final news = await _apiService.fetchNews(selectedCategory.value);
      newsList.assignAll(news);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load news: $e');
    } finally {
      isLoading.value = false;
    }
  }
}