class Photo {
  final int id;
  final String author;
  final int height;
  final int width;
  final String url;
  final String downloadUrl;

  const Photo({
    required this.id,
    required this.author,
    required this.height,
    required this.width,
    required this.url,
    required this.downloadUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: int.parse( json['id'].toString()),
      author: json['author'].toString(),
      width: int.parse(json['width'].toString()),
      height: int.parse( json['height'].toString()),
      url: json['url'].toString(),
      downloadUrl: json['download_url'].toString(),
    );
  }
}
