class Post {
  final String title;
  final String body;
  final String author;
  final String date;
  final String image;

  Post({
    required this.title,
    required this.body,
    required this.author,
    required this.date,
    required this.image,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      body: json['body'],
      author: json['author'],
      date: json['date'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
        'author': author,
        'date': date,
        'image': image,
      };
}
