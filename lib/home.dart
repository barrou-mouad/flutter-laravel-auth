import 'package:flutter/material.dart';
import 'package:login_register/login.dart';
import 'package:login_register/services/auth.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(child: Consumer<Auth>(
        builder: (context, auth, child) {
          if (auth.authenticated == true)
            return ListView(children: [
              DrawerHeader(
                  child: Column(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.home),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text( Provider.of<Auth>(context, listen: false).user!.name.toString())
                ],
              )),
              ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.logout),
                onTap: () => {
                  Provider.of<Auth>(context, listen: false).logout(),
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ))
                },
              )
            ]);
          else
            return ListView(children: [
              ListTile(
                title: Text("Login"),
                trailing: Icon(Icons.login),
              )
            ]);
        },
      )),
      appBar: AppBar(),
      body: Center(
        child: Text("HELLO WORLD"),
      ),
    );
  }
}
