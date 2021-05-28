import 'package:dashboard_magazan_casa/app/models/department.dart';
import 'package:dashboard_magazan_casa/models/sections_model.dart';
import 'package:dashboard_magazan_casa/repositories/departments_repository.dart';
import 'package:dashboard_magazan_casa/repositories/products_repository.dart';
import 'package:dashboard_magazan_casa/repositories/sections_repository.dart';
import 'package:dashboard_magazan_casa/stores/sections.store.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  var sectionDropdown = 'EQUIPAMENTO INFORMATICA';
  var dropdownValue = 'INFORMATICA';
//Departments(id: 2, name: "INFORMATICA", cod: 203, imageUrl: 'imageUrl');
  late Departments selectedDepartment;
  late List<Departments> departments;

  var departmenstJson = [];
  late int valueDepartment = 203;

  ProductsRepository productsRepository = ProductsRepository();
  final sectionStore = SectionStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sectionStore.get_sections(valueDepartment);
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController idRMSController = TextEditingController();
  TextEditingController eanController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController inventoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DepartmentsRepository departmentsRepository = DepartmentsRepository();
    SectionsRepository sectionsRepository = SectionsRepository();
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            new TextFormField(
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: new InputDecoration(hintText: 'Nome do produto'),
              maxLength: 80,
            ),
            new TextFormField(
              controller: idRMSController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: new InputDecoration(hintText: 'Id RMS'),
              keyboardType: TextInputType.phone,
              maxLength: 10,
            ),
            new TextFormField(
                controller: eanController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: new InputDecoration(hintText: 'EAN'),
                keyboardType: TextInputType.emailAddress,
                maxLength: 40),
            new TextFormField(
                controller: imageController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: new InputDecoration(hintText: 'Imagem'),
                keyboardType: TextInputType.emailAddress,
                maxLength: 40),
            new TextFormField(
                controller: descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: new InputDecoration(hintText: 'Descrição'),
                keyboardType: TextInputType.emailAddress,
                maxLength: 40),
            new TextFormField(
                controller: priceController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: new InputDecoration(hintText: 'Preço'),
                keyboardType: TextInputType.emailAddress,
                maxLength: 40),
            new TextFormField(
                controller: inventoryController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: new InputDecoration(hintText: 'Estoque'),
                keyboardType: TextInputType.emailAddress,
                maxLength: 40),
            FutureBuilder<List<Departments>>(
                future: departmentsRepository.get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.length > 1) {
                      snapshot.data!.forEach((element) {
                        departmenstJson.add(element);
                      });
                    } else {
                      departmenstJson.add(snapshot.data);
                    }
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
            FutureBuilder<List<Sections>>(
                future: sectionsRepository.get(valueDepartment),
                builder: (context, snapshot) {
                  sectionDropdown = sectionStore.sections[0].name;

                  if (snapshot.hasData) {
                    // snapshot.data!.forEach((element) {
                    //   sectionsNames.add(element.name);
                    // });

                    return DropdownButton(
                      value: sectionDropdown,
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
                          sectionDropdown = newValue.toString();
                        });
                      },
                      items: sectionStore.sections.map((item) {
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
                }),
            new SizedBox(height: 15.0),
            new ElevatedButton(
              onPressed: () {
                productsRepository.add_product(
                  nameController.text,
                  idRMSController.text,
                  int.parse(eanController.text),
                  imageController.text,
                  descriptionController.text,
                  double.parse(priceController.text),
                  'S',
                  int.parse(inventoryController.text),
                  1,
                  241,
                  208,
                );
              },
              child: new Text('Enviar'),
            )
          ],
        ),
      ),
    );
  }

  void _validarCampos() {}
}
