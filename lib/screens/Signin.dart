import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zeal/screens/signuppage.dart';
import 'package:zeal/screens/userslist.dart';
import 'package:zeal/widgets/Textfieldwidget.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  _SigninpageState createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back! Glad to \n see you, Again!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 25),
            Textfieldwidget(
              controller: emailcontroller,
              text: 'Enter your email',
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Textfieldwidget(
                    controller: passwordcontroller,
                    text: 'Enter your password',
                    obscure: obscure,
                    iconButton: IconButton(
                      icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 35),
            Center(
              child: Container(
                height: 60,
                width: 205,
                decoration: BoxDecoration(
                  color: const Color(0xff0B8FAC),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextButton(
                  onPressed: () {
                    if (emailcontroller.text.isEmpty &&
                        passwordcontroller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Enter email and password '),
                        duration: Duration(seconds: 4),
                      ));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Userlist(),
                          ));
                    }
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signuppage(),
                          ));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Color(0xff0B8FAC)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or Login with',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Image.asset(
                    'asset/images/Vector.png',
                    height: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Image.asset('asset/images/Group 123.png'),
                  SizedBox(
                    width: 30,
                  ),
                  Image.asset('asset/images/Frame 3.png')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
