import 'package:flutter/material.dart';
import 'package:hackatlon_app/Widgets/userbar.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Email',
                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0)
                    )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0)
                    )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: ButtonTheme(
                height: 56,
                child: ElevatedButton(
                  child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20)),
                  /*color: Colors.black87,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),*/
                  onPressed: () => {
                    Navigator.pop(context)
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

