import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Services/user.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _signupState();
}

class _signupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';
  bool _obscure = true;
IconData _obscureIcon =Icons.visibility_off;
createAccoount(User user) async{
  final response =await http.post(
    Uri.parse('http://10.0.2.2:8080/api/v1/auth/register/user'),
    headers : <String, String>{
      'Content-Type' : 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'username' : user.username,
      'email' : user.email,
      'password': user.password,
      }),
  );
  print(user.email);
  print(response.body);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/yana.png'),
                fit: BoxFit.cover
            ),
          ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.0, 50.0, 10.0, 0),
              child: Column(children: <Widget>[
                SizedBox(height: 130.0),
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
                            prefixIcon: Icon(Icons.person),
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
                          username = value!;
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              label: Text('email'),
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please provide a email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email = value!;
                          }),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                          obscureText: _obscure,
                          decoration: InputDecoration(
                              label: Text('password'),
                              prefixIcon: Icon(Icons.lock_rounded),
                              suffixIcon: IconButton(
                                icon: Icon(_obscureIcon),
                                onPressed: (){
                                  setState(() {
                                    _obscure = !_obscure;
                                    if(_obscure){
                                      _obscureIcon =Icons.visibility_off;
                                    }
                                  });
                                },
                              ),
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
                            password = value!;
                          }),
                      SizedBox(
                        height: 25.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            User user = User(
                              username: username,
                              email: email,
                              password: password
                            );
                            createAccoount(user);
                            print(username);
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
          ),
        ));
  }
}
