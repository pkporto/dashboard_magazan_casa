import 'package:dashboard_magazan_casa/app/models/department.dart';
import 'package:dashboard_magazan_casa/models/sections_model.dart';
import 'package:dashboard_magazan_casa/repositories/departments_repository.dart';
import 'package:dashboard_magazan_casa/repositories/sections_repository.dart';
import 'package:dashboard_magazan_casa/stores/sections.store.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  var dropdownValue1;
  var dropdownValue = 'INFORMATICA';
//Departments(id: 2, name: "INFORMATICA", cod: 203, imageUrl: 'imageUrl');
  late Departments selectedDepartment;
  late List<Departments> departments;

  var departmenstJson = [];
  late int valueDepartment = 203;

  final sectionStore = SectionStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DepartmentsRepository departmentsRepository = DepartmentsRepository();
    SectionsRepository sectionsRepository = SectionsRepository();

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        child: Column(
          children: <Widget>[
            new TextFormField(
              decoration: new InputDecoration(hintText: 'Nome do produto'),
              maxLength: 80,
            ),
            new TextFormField(
              decoration: new InputDecoration(hintText: 'Id RMS'),
              keyboardType: TextInputType.phone,
              maxLength: 10,
            ),
            new TextFormField(
                decoration: new InputDecoration(hintText: 'EAN'),
                keyboardType: TextInputType.emailAddress,
                maxLength: 40),
            new TextFormField(
                decoration: new InputDecoration(hintText: 'Imagem'),
                keyboardType: TextInputType.emailAddress,
                maxLength: 40),
            new TextFormField(
                decoration: new InputDecoration(hintText: 'Descrição'),
                keyboardType: TextInputType.emailAddress,
                maxLength: 40),
            new TextFormField(
                decoration: new InputDecoration(hintText: 'Preço'),
                keyboardType: TextInputType.emailAddress,
                maxLength: 40),
            new TextFormField(
                decoration: new InputDecoration(hintText: 'Estoque'),
                keyboardType: TextInputType.emailAddress,
                maxLength: 40),
            FutureBuilder<List<Departments>>(
                future: departmentsRepository.get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    snapshot.data!.forEach((element) {
                      departmenstJson.add(element);
                    });
                    return DropdownButton(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 31, 229, 146),
                      ),
                      underline: Container(
                        height: 2,
                        color: Color.fromARGB(255, 31, 229, 146),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue.toString();

                          // valueDepartment = departmenstJson.firstWhere(
                          //     (element) => element.name == dropdownValue);

                          departmenstJson.forEach((element) {
                            if (element.name == dropdownValue) {
                              valueDepartment = element.cod;
                            }
                          });

                          sectionStore.get_sections(valueDepartment);

                          dropdownValue1 = 'FORNO E FOGAO';
                          // selectedDepartment = newValue as Departments;
                          print(valueDepartment);
                          print(sectionStore.sections);
                        });
                      },
                      items: snapshot.data!.map((item) {
                        return DropdownMenuItem(
                          value: item.name,
                          child: Text(item.name),
                        );
                      }).toList(),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.connectionState);
                    return CircularProgressIndicator();
                  }
                  return CircularProgressIndicator();
                }),
            /* FutureBuilder<List<Sections>>(
                future: sectionsRepository.get(valueDepartment),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // snapshot.data!.forEach((element) {
                    //   sectionsNames.add(element.name);
                    // });

                    return DropdownButton(
                      value: dropdownValue1,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 31, 229, 146),
                      ),
                      underline: Container(
                        height: 2,
                        color: Color.fromARGB(255, 31, 229, 146),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue1 = newValue.toString();
                        });
                      },
                      items: snapshot.data!.map((item) {
                        return DropdownMenuItem(
                          value: item.name,
                          child: Text(item.name),
                        );
                      }).toList(),
                    );
                  } else {
                    print(snapshot.connectionState);
                    print('snapshot.connectionState');
                    return CircularProgressIndicator();
                  }
                  return CircularProgressIndicator();
                }), */
            new SizedBox(height: 15.0),
            new ElevatedButton(
              onPressed: () {},
              child: new Text('Enviar'),
            )
          ],
        ),
      ),
    );
  }
}
