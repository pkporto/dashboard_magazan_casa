// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class ProductsRepository {
  // ignore: non_constant_identifier_names
  Future add_product(
      String name,
      String idRMS,
      int ean,
      String image,
      String description,
      double price,
      String active,
      int inventory,
      int store,
      int department,
      int section) async {
    var resposta =
        await http.post(Uri.parse('http://localhost:3333/addProducts'), body: {[
      "name": name,
      "idRMS": idRMS,
      "ean": ean,
      "image_url": image,
      "description": description,
      "price": price,
      "active": active,
      "inventory": inventory,
      "store_id": store,
      "department_cod": department,
      "section_cod": section
         ] }, headers: {
      "token":
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1hdGV1c3BlZHJvc29AZ21haWwuY29tIiwiaWF0IjoxNjIyMjI1MDkxLCJleHAiOjE2MjIzMTE0OTF9.UC4OrxBg0feA_sIUrOmCEk7f7NU39iLVOTQuO_enyos'
    });
    print(resposta.statusCode);
    if (resposta.statusCode == 201) {
      print(resposta.body);
      return resposta.body;
    } else {
      return false;
    }
  }
}
