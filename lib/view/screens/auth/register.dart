// ignore_for_file: use_build_context_synchronously, camel_case_types, sized_box_for_whitespace
import 'package:flutter/material.dart';
import '../../../core/services/authentication/auth_service.dart';
import '../../../core/shared/componans.dart';

class Register_Screen extends StatefulWidget {
  const Register_Screen({super.key});

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  bool isRegister = false;
  AuthService auth = AuthService();
  var formKey = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _usernamecontriller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Image.asset(
                  "assets/images/logo.png",
                ),
                const Text(
                  "create an account",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  "Help us finish setting up your account",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
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
                        return "enter your name";
                      }
                      return null;
                    },
                    controller: _usernamecontriller,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        labelText: 'User name',
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
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
                        labelText: 'Enter tour email address',
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
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
                    obscureText: true,
                    controller: _passwordcontroller,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        labelText: 'Enter a password',
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
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
                    obscureText: true,
                    controller: _confirmpasswordcontroller,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        labelText: 'confirm password',
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                  height: 50,
                  width: 400,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          if (_passwordcontroller.text ==
                              _confirmpasswordcontroller.text) {
                            setState(() {
                              isRegister = true;
                            });
                            await auth
                                .signUpWithEmailAndPassword(
                                    email: _emailcontroller.text,
                                    password: _passwordcontroller.text,
                                    name: _usernamecontriller.text)
                                .then((onValue) {
                              auth.signOut();
                              defaultToast("Go to Verify your email",
                                  Colors.deepOrangeAccent);
                              // Timer(Duration(seconds: 1), () {
                              //
                              // });
                              Navigator.pop(context);
                            }).catchError((onError) {
                              setState(() {
                                isRegister = false;
                              });
                              defaultToast(
                                  "Something Get Wrong try again", Colors.red);
                            });
                          } else {
                            defaultToast(
                                "password should be the same", Colors.red);
                          }
                        }
                      },
                      child: isRegister
                          ? const CircularProgressIndicator()
                          : const Text(
                              "continue",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// باسم هتعمل الباسورد وهتعمل validation