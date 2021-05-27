class Sections {
  int id;
  String name;
  int cod;
  String imageUrl;

  Sections({this.id, this.name, this.cod, this.imageUrl});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cod'] = this.cod;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
