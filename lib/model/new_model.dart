class NewModel {
  String? name;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  NewModel({
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewModel.fromJson(Map<String, dynamic> json) {
    return NewModel(
      name: json["source"]["name"],
      author: json["author"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage:
          json["urlToImage"] ??
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMB0fBQZxXsfbs9efulzga7NEOOGkDF9DKjQ&s",
      publishedAt: json["publishedAt"],
      content: json["content"],
    );
  }
}
