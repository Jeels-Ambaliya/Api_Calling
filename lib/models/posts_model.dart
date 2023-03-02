class Post {
  final int Id, UserId;
  final String Title, Body;

  Post({
    required this.Id,
    required this.UserId,
    required this.Title,
    required this.Body,
  });

  factory Post.fromMap({required Map data}) {
    return Post(
      Id: data['id'],
      UserId: data['userId'],
      Title: data['title'],
      Body: data['body'],
    );
  }
}
