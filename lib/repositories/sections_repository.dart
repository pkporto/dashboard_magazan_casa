import 'dart:convert';

// import 'package:flutter_2/app/models/sections.dart';
import 'package:dashboard_magazan_casa/models/sections_model.dart';
import 'package:http/http.dart' as http;

class SectionsRepository {
  Future<List<Sections>> get_all() async {
    var response = await http.get(
        Uri.parse('http://localhost:3333/getallsections?department_cod=209'));
    List<Sections> sections;

    var json = jsonDecode(response.body);

    sections = (json['data'] as List)
        .map((section) => Sections.fromJson(section))
        .toList();
    if (response.statusCode == 200) {
      // print(sections);
      return sections;
    } else {
      print('object');
      return sections;
    }
  }
}
