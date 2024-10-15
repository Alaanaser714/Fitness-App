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
  bool _isObscuredPassword = true;
  bool _isObscuredConfirmPassword = true;
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
                  "assets/images/fitness_icon.png",
                  width: 100,
                ),
                const Text(
                  "Create Your Fitness Account",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
                const Text(
                  "Join us and start your fitness journey today!",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
                        hintText: 'User name',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
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
                    borderRadius: BorderRadius.circular(15),
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
                        hintText: 'Enter your email address',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
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
                    borderRadius: BorderRadius.circular(15),
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
                    controller: _passwordcontroller,
                    obscureText: _isObscuredPassword,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscuredPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscuredPassword = !_isObscuredPassword;
                            });
                          },
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintText: 'Enter a password',
                        border: InputBorder.none,
                        hintStyle: const TextStyle(
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
                    borderRadius: BorderRadius.circular(15),
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
                    obscureText: _isObscuredConfirmPassword,
                    controller: _confirmpasswordcontroller,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscuredConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscuredConfirmPassword =
                                  !_isObscuredConfirmPassword;
                            });
                          },
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintText: 'confirm password',
                        border: InputBorder.none,
                        hintStyle: const TextStyle(
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
                                  color: Colors.black87),
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
