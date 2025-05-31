import '../models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel news;

  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail', style: TextStyle(fontSize: 20.sp)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.urlToImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  news.urlToImage!,
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200.h,
                    color: Colors.grey[300],
                    child: Icon(Icons.broken_image, size: 50.sp),
                  ),
                ),
              ),
            SizedBox(height: 16.h),
            Text(
              news.title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            if (news.author != null)
              Text('By ${news.author}', style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
            Text(
              news.publishedAt,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(height: 16.h),
            Text(
              news.description,
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 16.h),
            if (news.content != null)
              Text(
                news.content!,
                style: TextStyle(fontSize: 14.sp),
              ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () async {
                final url = Uri.parse(news.url);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not open the article', style: TextStyle(fontSize: 14.sp))),
                  );
                }
              },
              child: Text('Read Full Article', style: TextStyle(fontSize: 14.sp)),
            ),
          ],
        ),
      ),
    );
  }
}