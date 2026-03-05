import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram/UI/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: TextFormField(
              controller: usernameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Username",
                hintText: "Enter your username",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Username is required";
                }
                if (value.length < 3) {
                  return "Username must be at least 3 characters";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 38,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>Home(user_name: usernameController.text)));
            },
            child: Container(
              // height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('confirm'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
