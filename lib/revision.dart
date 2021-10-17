import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Revision extends StatefulWidget {
  const Revision({Key? key}) : super(key: key);

  @override
  _RevisionState createState() => _RevisionState();
}

class _RevisionState extends State<Revision> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(opacity: .3,
                child: Image.network('https://thumbs.dreamstime.com/b/login-screen-password-area-computer-34615355.jpg')),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email"
                      ),
                      controller: emailC,
                    ),
                  ),
                  TextFormField(
                    obscureText: showPassword,
                    decoration: InputDecoration(
                      suffix: IconButton(
                        onPressed: (){
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: !showPassword ? const Icon(Icons.visibility) :const Icon(Icons.visibility_off) ,
                      ),
                        labelText: "password"
                    ),
                    controller: passC,
                  ),
                  ElevatedButton(onPressed: () async{
                    var response = await http.post(Uri.parse('https://retail.amit-learning.com/api/login'),
                      headers: <String,String>{
                        'Content-Type' : 'application/json'
                      },
                      body: jsonEncode(<String,String>{
                        'email':emailC.text,
                        'password':passC.text
                      }),);
                    if(response.statusCode ==200){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const Scaffold(
                          body: Center(child: Text('LoggedIn Successfully')),
                        );
                      }));
                    }
                    else{
                      print('done');
                    }
                  }, child: const Text("Login"))
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
