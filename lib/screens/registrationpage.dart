import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/userprovider.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.black,
          title: Text('REGISTER PAGE')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            Padding(padding: EdgeInsets.only(bottom: 5)),
            ElevatedButton(
              onPressed: () {
                final username = _usernameController.text;
                final password = _passwordController.text;
                Provider.of<UserProvider>(context, listen: false).register(username, password);
                Navigator.pop(context); // Go back to the login page
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
