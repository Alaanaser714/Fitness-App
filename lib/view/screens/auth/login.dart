// ignore_for_file: use_build_context_synchronously, camel_case_types, non_constant_identifier_names, avoid_types_as_parameter_names, sized_box_for_whitespace

import 'package:fitness_app/view/screens/auth/register.dart';
import 'package:flutter/material.dart';
import '../../../core/services/authentication/auth_gate.dart';
import '../../../core/services/authentication/auth_service.dart';
import '../../../core/shared/componans.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  AuthService auth = AuthService();
  final bool _isObscured = true;
  bool isLogin = false;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                  ),
                  const Text(
                    "login to your account",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(width: 1, color: Colors.white),
                      color: const Color.fromARGB(255, 141, 139, 139),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "enter your email";
                        }
                        return null;
                      },
                      controller: _emailcontroller,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        labelText: 'enter you email',
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(width: 1, color: Colors.white),
                      color: const Color.fromARGB(255, 141, 139, 139),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "enter your password";
                        }
                        return null;
                      },
                      obscureText: _isObscured,
                      controller: _passwordcontroller,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.security,
                          color: Colors.white,
                        ),
                        labelText: 'enter password',
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          //باسم هتخلي لما يدوس يروح صفحه جديده فيها اب بار ويدخل الايميل بتاعه(هتعمل الشكل بس)
                          // سيد هتربط الايميل مع الفاير بيز
                        },
                        child: const Text("Forget password?",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLogin = true;
                            });
                            await auth
                                .signInWithEmailAndPassword(
                                    email: _emailcontroller.text,
                                    password: _passwordcontroller.text)
                                .then(
                              (value) {
                                auth.getCurrentUser()!.emailVerified
                                    ? defaultToast(
                                        "Login Successful", Colors.green)
                                    : defaultToast("Verify your email first",
                                        Colors.deepOrangeAccent);
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AuthGate(),
                                  ),
                                  (route) => false,
                                );
                              },
                            ).catchError((onError) {
                              defaultToast("Username or Password is incorrect",
                                  Colors.red);
                            });
                            setState(() {
                              isLogin = false;
                            });
                          }
                        },
                        child: isLogin
                            ? const CircularProgressIndicator()
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account ?",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext) {
                              return const Register_Screen();
                            }),
                          );
                        },
                        child: const Text(
                          "sign up",
                          style: TextStyle(fontSize: 15, color: Colors.orange),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  const Text(
                    "Alternatively login with:",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: Colors.orange)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.apple,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            // سيد هتشيل دي وتحط الموبيل وتلربط فاير بيز
                            "Apple ID",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: Colors.orange)),
                      child: InkWell(
                        onTap: () {
                          auth.signInWithGoogle();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/Google - png 0.png"),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Google",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
