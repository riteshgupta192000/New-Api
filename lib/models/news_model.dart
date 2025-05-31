class NewsModel {
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? author;
  final String? content;

  NewsModel({
    required this.title,
    this.description = '',
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.author,
    this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] ?? '',
      author: json['author'],
      content: json['content'],
    );
  }
}