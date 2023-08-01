class PlaceModel {
  int? id;
  String? title;
  String? latitude;
  String? longitude;

  PlaceModel(this.id, this.title, this.latitude, this.longitude);

  PlaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}
