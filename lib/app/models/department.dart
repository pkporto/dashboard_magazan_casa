class Departments {
  int id;
  String name;
  int cod;
  String imageUrl;

  Departments(
      {required this.id,
      required this.name,
      required this.cod,
      required this.imageUrl});

  factory Departments.fromJson(Map<String, dynamic> json) {
    return Departments(
        id: json['id'],
        name: json['name'],
        cod: json['cod'],
        imageUrl: json['image_url']);
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
