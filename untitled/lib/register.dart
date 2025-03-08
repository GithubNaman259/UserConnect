import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);
  @override
  _MyRegisterState createState() => _MyRegisterState();

}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/register.png"),
              fit: BoxFit.cover,
          ),
      ),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,

          ),
          backgroundColor: Colors.transparent,
          body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 35, top: 100),
                  child: Text(
                    'Create\nAccount 💐',
                    style: TextStyle(color: Colors.white,
                        fontSize: 33,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.28,
                          right: 35,
                          left: 35),
                      child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  fillColor: Color.fromARGB(180, 255, 255, 255),
                                  filled: true,
                                  hintText: 'Name',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
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
                                    onPressed: () {},

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