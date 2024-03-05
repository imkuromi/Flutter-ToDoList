import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onboarding_screen/component/my_botton.dart";
import "package:onboarding_screen/component/my_textfield.dart";
import "package:onboarding_screen/screen/home_screen.dart";
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final repasswordController = TextEditingController();

  signUpWithEmail() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      _showMyDialog("SignUP Successfully");
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }

  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            backgroundColor: Colors.amberAccent,
            title: const Text('AlertDialog Title'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Welcome to our community',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              '\nTo get started, please provide your information to create an account.\n',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                controller: nameController,
                hintText: 'Enter your name.',
                obscureText: false,
                labelText: 'Name'),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                controller: emailController,
                hintText: 'Enter your email.',
                obscureText: false,
                labelText: 'Email'),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                controller: passwordController,
                hintText: 'Enter your password.',
                obscureText: false,
                labelText: 'Password'),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                controller: repasswordController,
                hintText: 'Enter your password again.',
                obscureText: false,
                labelText: 'RePassword'),
            const SizedBox(
              height: 20,
            ),
            MyBotton(hinText: "Sign Up", onTap: signUpWithEmail),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Have a member?',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    child: const Text('Sign in.'))
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
