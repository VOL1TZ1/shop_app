import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
   RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'RESISTER',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 60.0,
                        color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    controller: nameC,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    controller: emailC,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: showPassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: !showPassword
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                    ),
                    controller: passC,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: MaterialButton(
                      onPressed: () async{
                        var response = await http.post(Uri.parse('https://retail.amit-learning.com/api/login'),
                          headers: <String,String>{
                            'Content-Type' : 'application/json'
                          },
                          body: jsonEncode(<String,String>{
                            'email':emailC.text,
                            'password':passC.text
                          }),);
                        if(response.statusCode ==201){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const Scaffold(
                              body: Center(child: Text('Registered Successfully')),
                            );
                          }));
                        }
                        else{
                          print('done');
                        }
                      },
                      color: Colors.blue,
                      child: const Text(
                        'RESISTER',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '''Already have an account? ''',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 16.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Sign In'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}