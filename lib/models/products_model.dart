class products_model {
  String name;
  String idRMS;
  String ean;
  String imageUrl;
  String description;
  String price;
  int inventory;
  int storeId;
  int departmentCod;
  int sectionCod;

  products_model(
      {this.name,
        this.idRMS,
        this.ean,
        this.imageUrl,
        this.description,
        this.price,
        this.inventory,
        this.storeId,
        this.departmentCod,
        this.sectionCod});

  products_model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    idRMS = json['idRMS'];
    ean = json['ean'];
    imageUrl = json['image_url'];
    description = json['description'];
    price = json['price'];
    inventory = json['inventory'];
    storeId = json['store_id'];
    departmentCod = json['department_cod'];
    sectionCod = json['section_cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['idRMS'] = this.idRMS;
    data['ean'] = this.ean;
    data['image_url'] = this.imageUrl;
    data['description'] = this.description;
    data['price'] = this.price;
    data['inventory'] = this.inventory;
    data['store_id'] = this.storeId;
    data['department_cod'] = this.departmentCod;
    data['section_cod'] = this.sectionCod;
    return data;
  }
}