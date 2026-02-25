import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 360,
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Sign in', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              TextField(
                controller: _userController,
                decoration: InputDecoration(labelText: 'Username', border: OutlineInputBorder()),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _passController,
                decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                obscureText: true,
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/main');
                  },
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
