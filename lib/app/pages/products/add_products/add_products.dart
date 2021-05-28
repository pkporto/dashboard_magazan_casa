import 'package:dashboard_magazan_casa/app/models/department.dart';
import 'package:dashboard_magazan_casa/models/sections_model.dart';
import 'package:dashboard_magazan_casa/repositories/departments_repository.dart';
import 'package:dashboard_magazan_casa/repositories/sections_repository.dart';
import 'package:flutter/material.dart';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  var dropdownValue1 = 'FORNO E FOGAO';
  var dropdownValue = 'INFORMATICA';

  late List<Departments> departments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DepartmentsRepository departmentsRepository = DepartmentsRepository();
    SectionsRepository sectionsRepository = SectionsRepository();
    List<String> departmentsNames = [];
    List<String> sectionsNames = [];
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
                      departmentsNames.add(element.name);
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
                        });
                      },
                      items: departmentsNames.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
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
                future: sectionsRepository.get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    snapshot.data!.forEach((element) {
                      sectionsNames.add(element.name);
                    });

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
                      items: sectionsNames.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.connectionState);
                    return CircularProgressIndicator();
                  }
                  return CircularProgressIndicator();
                }),
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
