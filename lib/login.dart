import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_register/home.dart';
import 'package:login_register/services/auth.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final storage = new FlutterSecureStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readToken();
  }

  void readToken() async {
    String? txt = await storage.read(key: "token");
    print("init : " + txt.toString());
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose

    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(
              children: [
                Text(
                  "HELLO !",
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.6,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  "assets/images/logo.png",
                  height: 270,
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 4,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            label: Text("email"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 4,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            label: Text("password"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(350, 50),
                              primary: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Provider.of<Auth>(context, listen: false).login();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ));
                            }
                          },
                          child: Text(
                            "Se connecter",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        )
                      ],
                    )),
                  )))
        ],
      ),
    )));
  }
}
