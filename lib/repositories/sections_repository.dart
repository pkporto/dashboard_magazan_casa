import 'dart:convert';

// import 'package:flutter_2/app/models/sections.dart';
import 'package:dashboard_magazan_casa/models/sections_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class SectionsRepository {
  Future<List<Sections>> get(int cod) async {
    var response = await http.get(Uri.parse(
        'http://localhost:3333/getallsections?department_cod=' +
            cod.toString()));
    List<Sections> sections;

    var json = jsonDecode(response.body);

    sections = (json['data'] as List)
        .map((section) => Sections.fromJson(section))
        .toList();
    if (response.statusCode == 200) {
      return sections;
    } else {
      print('object');
      return sections;
    }
  }
}
