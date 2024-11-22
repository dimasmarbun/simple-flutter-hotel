import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/userprovider.dart';
import '../screens/registrationpage.dart';
import '../widgets/defaultframe.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.black,
            title: Text('LOG IN PAGE')),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset from the top-left corner
                  ),
                ]),
            width: 500.0,
            height: 400.0,
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.face_2_outlined),
                  Padding(padding: EdgeInsets.only(right: 10)),
                  SizedBox(
                    width: 300.0,
                    height: 50.0,
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(labelText: 'Username'),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.password_outlined),
                  Padding(padding: EdgeInsets.only(right: 10)),
                  SizedBox(
                      width: 300.0,
                      height: 50.0,
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ))
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final username = _usernameController.text;
                        final password = _passwordController.text;
                        if (Provider.of<UserProvider>(context, listen: false)
                            .login(username, password)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyDefaultFrame(),
                              ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Username or Password is Incorrect, Try Again!')));
                        }
                      },
                      child: Text('Login'),
                    ),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text('Dont have an account yet? do Register'),
                  ),
                ],
              )
            ]),
          ),
        ));
  }
}
