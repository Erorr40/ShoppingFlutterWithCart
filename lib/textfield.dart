import 'package:flutter/material.dart';
import 'package:textformfieldex/signupmodel.dart';

import 'formfieldcomponenet.dart';


class TextFieldTest extends StatelessWidget {
  new({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<SignUpData> get dataList => [
    SignUpData(
      label: "Email",
      icon: Icons.mail,
      controller: emailController,
      function: (value) =>
          value == null || value.isEmpty ? "Email must not be empty" : null,
    ),
    SignUpData(
      label: "Password",
      icon: Icons.lock,
      controller: passController,
      obscureText: true,
      function: (value) =>
          value == null || value.isEmpty ? "Password must not be empty" : null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(117, 94, 43, 111),
          centerTitle: true,
          title: Text(
            "Text Form Feild",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 70),
                ),
                MyTextFormFeild(data: dataList[0]),
                MyTextFormFeild(data: dataList[1]),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final email = emailController.text;
                      final pass = passController.text;
                      print("Email is: $email, password is $pass");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(117, 94, 43, 111),
                  ),
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
