import 'package:application1/constants/colors.dart';
import 'package:application1/screen/button.dart';
import 'package:application1/screen/component.dart';
import 'package:application1/screen/home.dart';
import 'package:application1/screen/tiles.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  //text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  //logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  //welcome
                  Text(
                    'Welcome Back! You\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  //uname
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: false,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //password
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //forgot pw
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  //sign in

                  GestureDetector(
                    child: Button(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  //continue with
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: tdGrey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            color: tdGrey,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: tdGrey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  //google _ apple
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SquareTile(imagePath: 'assets/apple.png'),
                      SizedBox(
                        width: 10,
                      ),
                      SquareTile(imagePath: 'assets/search.png'),
                    ],
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  //not a member?reg
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Not a member?',
                        style: TextStyle(
                          color: tdGrey,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Register Now',
                        style: TextStyle(
                          color: tdBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
