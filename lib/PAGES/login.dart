import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/Services/user.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';


  Widget buttonContent = Text('Login');

  Widget loadingDisplay = CircularProgressIndicator();

 Future<bool>login(User user)async{
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/auth/login'),
      headers: <String, String>{
        'Content-Type' :'application/json; charset=UTF-8',
    },
      body: jsonEncode(<String, dynamic>{
        'usernameOrEmail' :user.email,
        'password' : user.password
      }),
    );
    if(response.statusCode==200){
      return true;
    }
    return false;
    //print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/yana.png'),
                fit: BoxFit.cover
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(15.0, 50.0, 10.0, 0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 130.0),
                Text(
                  ' LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.0,
                    fontSize: 24.5,
                  ),
                ),
                SizedBox(height: 30.0),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        maxLength: 40,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please provide an Email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email = value!;
                        },
                      ),
                      SizedBox(height: 30.0),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please provide a password';
                          }
                          if (value.length < 8) {
                            return 'Password should be at least 8 characters long';
                          }
                          if (value.length > 20) {
                            return 'Password must be 20 characters long only';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          password = value!;
                        },
                      ),
                      SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: (){
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            User user = User(
                              username:'',
                              email:email,
                              password: password,

                            );
                            /*if(login(user)){
                              Navigator.pushReplacementNamed(context, '/dashboard');
                          }*/
                            setState(() {
                              buttonContent = FutureBuilder(
                                  future: login(user),
                                  builder: (context, snapshot){
                                    if(snapshot.connectionState== ConnectionState.waiting){
                                      return loadingDisplay;
                                    }
                                    if(snapshot.hasData){

                                    }
                                    return Text ('login');
                                  }
                              );
                            });
                            Navigator.pushReplacementNamed(context, '/');
                            // Implement your login logic here
                          }
                        },
                        child: buttonContent,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'or Login with',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          // Implement your Google login logic here
                        },
                        child: Text(' Google'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      ElevatedButton(
                        onPressed: () {
                          // Implement your Facebook login logic here
                        },
                        child: Text(' Facebook'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15.0,),
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
                              'Signup Here',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onTap: ()=> Navigator.popAndPushNamed(context, '/signup'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
