class GalleryModel {
  int id;
  String url;

  GalleryModel({required this.id, required this.url});

  GalleryModel.from(Map<String, dynamic> json)
      : id = json['id'] as int,
        url = json['name'] as String;

  Map<String, dynamic> toJson() {
    return {'id': id, 'url': url};
  }
}
