import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();

}

class _MyLoginState extends State<MyLogin> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> insertrecord() async
  {
    if(email.text != "" || password.text != "")
    {
      try
      {
        String uri = "http://172.16.8.146/practice_api/insert_record.php";
        var res=await http.post(Uri.parse(uri),body:
        {
          "email": email.text,
          "password": password.text,
        });
        var response = jsonDecode(res.body);
        if(response["success"] == "true")
        {
          print("Record Inserted");
          email.text = "";
          password.text = "";
        }
        else
        {
          print("Some Error Occurred");
        }

      }
      catch(e)
      {
        print(e);
      }

    }
    else
    {
      print("Please Fill All Fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/login.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 35, top: 130),
                  child: Text(
                    'Welcome\nUser 🙏🏻',
                    style: TextStyle(color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5,
                          right: 35,
                          left: 35),
                      child: Column(
                          children: [
                            TextField(
                              controller: email,
                              decoration: InputDecoration(
                                  fillColor: Color.fromARGB(180, 255, 255, 255),
                                  filled: true,
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Color.fromARGB(180, 255, 255, 255),
                                  filled: true,
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Secure Sign In -->',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    color: Colors.indigo,
                                    onPressed: () {
                                      insertrecord();
                                    },

                                    icon: Icon(Icons.safety_check_sharp),

                                  ),

                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'register');
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot Password ?',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    )),
                              ],
                            )
                          ]
                      )
                  ),
                )
              ]
          )
      ),
    );
  }
}