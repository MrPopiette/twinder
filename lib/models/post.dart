class Post {
  final int idPost;
  final int idSender;
  final String content;
  final String date;
  final String? image;

  Post({required this.idPost, required this.idSender, required this.content, required this.date, this.image});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      idPost: json['id_post'],
      idSender: json['sender_id_user'],
      content: json['content'],
      date: json['date'],
      image: json['image'],
    );
  }
}
