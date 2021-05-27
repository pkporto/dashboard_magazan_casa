import 'dart:convert';

import 'package:dashboard_magazan_casa/app/models/department.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class DepartmentsRepository {
  Future<List<Departments>> get() async {
    List<Departments> departments;

    var response = await http
        .get(Uri.parse('http://localhost:3333/getalldepartments?store_id=1'));

    var json = jsonDecode(response.body);

    departments = (json['data'] as List)
        .map((department) => Departments.fromJson(department))
        .toList();
    if (response.statusCode == 200) {
      // print(departments);
      return departments;
    } else {
      print('object');
      return departments;
    }
  }
}
