class Photo {
  final int id;
  final int albumId;
  final String title;
  final String thumbnailUrl;

  Photo({required this.id, required this.albumId, required this.title, required this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      albumId: json['albumId'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}