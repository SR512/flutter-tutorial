import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learningapp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  final _formKey = GlobalKey<FormState>();
  bool isChnageButton = false;

  submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isChnageButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Routes.home);
      setState(() {
        isChnageButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/login_page.png", fit: BoxFit.cover),
              SizedBox(
                height: 20.2,
              ),
              Text("Welcome $name",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 20.2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter mobile", labelText: "Mobile"),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field is required.";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter passowrd", labelText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field is required.";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(isChnageButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => submitForm(context),
                        child: AnimatedContainer(
                          width: isChnageButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: isChnageButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          duration: Duration(seconds: 1),
                        ),
                      ),
                    )
                    // ElevatedButton(
                    //     onPressed: (){
                    //  Navigator.pushNamed(context,Routes.home);
                    // }, child: Text("Login"),
                    // style:TextButton.styleFrom(
                    //   minimumSize:Size(150, 40)),
                    // )
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
