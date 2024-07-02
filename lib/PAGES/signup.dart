import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _signupState();
}

class _signupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15.0, 50.0, 10.0, 0),
            child: Column(children: <Widget>[
              Text(
                'Lets Get Started!',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.0,
                    fontSize: 24.5),
              ),
              SizedBox(
                height: 30.0,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      maxLength: 40,
                      decoration: InputDecoration(
                          label: Text('Name'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please provide a name';
                        }
                        if (value.length < 2) {
                          return 'Name should be atleast 3 letters long';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        name = value!;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            label: Text('email'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please provide a email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          name = value!;
                        }),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            label: Text('password'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please provide a password';
                          }
                          if (value.length < 8) {
                            return 'password should be atleast 8 letters long';
                          }
                          if (value.length > 20) {
                            return 'Password must be 20 characters long only';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          name = value!;
                        }),
                    SizedBox(
                      height: 25.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          print(name);
                          print(email);
                          print(password);
                        }
                      },
                      child: Text('Sign Up'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          foregroundColor: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Dont have an account?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        InkWell(
                          child: Text(
                            'login Here',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onTap: ()=> Navigator.popAndPushNamed(context, '/login'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
