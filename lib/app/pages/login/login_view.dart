import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GestureDetector(child: Text('Texto'), onTap: (){
        },),
      ),
    );
  }
}
