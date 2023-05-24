//making the datamodel
class Myapi {
  int? userId;
  int? id;
  String? title;
  String? body;

  Myapi({this.userId, this.id, this.title, this.body}); //

  Myapi.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}

class secondApi {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumnnailUrl;

  secondApi({
    this.albumId,
    this.id,
    this.thumnnailUrl,
    this.title,
    this.url,
  });

  secondApi.fromJson(Map<String, dynamic> json) {
    albumId = json["albumId"];
    id = json["id"];
    thumnnailUrl = json["thumbnailUrl"];
    title = json["title"];
    url = json["url"];
  }
}
