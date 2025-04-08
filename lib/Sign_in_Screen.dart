import 'package:crud_application/user_data_model.dart';
import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
import 'MainScreen.dart';
import 'Sign_Up_Screen.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  late String emailId;
  String? password;
  late UserData _userData;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool error = false;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    UserDatabase.instance.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign In",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Registered Email Address";
                      } else if (error == true) {
                        return "User Not Found";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      emailId = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Email Address",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter a valid Password";
                      } else if (value != _userData.password) {
                        return "Invalid Password";
                      }
                      return null;
                    },
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Password", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    _userData = await UserDatabase.instance.readNote(emailId);
                    setState(() {
                      error = false;
                    });
                  } catch (e) {
                    error = true;
                  }
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MainScreen()));
                  }
                },
                child: Text("Sign In"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(vertical: 20),
        height: 100,
        child: GestureDetector(
            onTap: () {
              _passwordController.clear();
              _emailController.clear();
              setState(() {
                error = false;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SignUpPage()),
              );
            },
            child: Text(
              "Don't have an account? Sign Up Here",
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}
