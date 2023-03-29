import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException;
import 'package:flutter/material.dart';
import 'package:new_fluttter/componets/my_button.dart';
import 'package:new_fluttter/componets/my_textfield.dart';
import 'package:new_fluttter/Pages/info_take.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  get onTap => null;

  //sign user in method
  void signUserUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // pop the circle
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InfoTake()),
    );
    // try creat the user
    try {
      //check if pass confirm
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        //error msg
        return ShowErrorMessage("Passwords do not match");
      }
    } on FirebaseAuthException catch (e) {
      // pop the circle
      Navigator.pop(context);
      //show er msg
      ShowErrorMessage(e.code);
    }
  }

//er msg to user
  void ShowErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 223, 221, 218),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: Column(children: [
              const SizedBox(height: 50),
              const Image(
                image: AssetImage('image/track.png'),
                height: 100,
              ),
              const SizedBox(height: 50),
              const Text(
                "Welcome! Please fill in all required fields :",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              MyTextfield(
                controller: emailController,
                hintText: 'Emial',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextfield(
                controller: passwordController,
                hintText: 'password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              MyTextfield(
                controller: confirmPasswordController,
                hintText: 'Confirm password',
                obscureText: true,
              ),
              const SizedBox(height: 30),
              MyButton(
                text: 'Sign Up',
                onTap: signUserUp,
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      onTap;
                    },
                    child: GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ]),
          )),
        ));
  }
}
