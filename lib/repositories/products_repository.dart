import 'package:http/http.dart' as http;

class ProductsRepository {
  Future add_product(
      String name,
      String idRMS,
      int ean,
      String image,
      String description,
      double price,
      int inventory,
      int store,
      int department,
      int section) async {
    var resposta = await http.post(Uri.parse('http://localhost:3333/addProducts'),
        body: {"name": name,
          "idRMS": idRMS,
          "ean": ean,
          "image_url": image,
          "description": description,
          "price": price,
          "inventory": inventory,
          "store_id": store,
          "department_cod": department,
          "section_cod": section});
    print(resposta.statusCode);
    if (resposta.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}