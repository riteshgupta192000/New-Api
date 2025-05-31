import 'package:get/get.dart';
import '../widgets/news_card.dart';
import '../routes/app_routes.dart';
import 'package:flutter/material.dart';
import '../controllers/news_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  final NewsController controller = Get.put(NewsController());

  HomeScreen({super.key});

  final List<String> categories = ['Technology', 'Sports', 'Entertainment'];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 50.h,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Obx(() => ChoiceChip(
                        label: Text(
                          categories[index],
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        selected: controller.selectedCategory.value == categories[index],
                        onSelected: (selected) {
                          if (selected) {
                            controller.setCategory(categories[index]);
                          }
                        },
                      )),
                );
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.newsList.isEmpty) {
                return Center(child: Text('No news available', style: TextStyle(fontSize: 16.sp)));
              }
              return ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: controller.newsList.length,
                itemBuilder: (context, index) {
                  final news = controller.newsList[index];
                  return NewsCard(
                    news: news,
                    onTap: () => Get.toNamed(AppRoutes.newsDetail, arguments: news),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}