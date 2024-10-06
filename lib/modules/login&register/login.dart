import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/modules/login&register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/authentication/auth_gate.dart';
import '../../services/authentication/auth_service.dart';
import '../../shared/componans.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  // Controller for password text field

  // Boolean to track if the password should be visible
  AuthService auth=AuthService();
  bool _isObscured = true;
  bool isLogin=false;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          key: formKey,
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Text(
                      "login to your account",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(width: 1, color: Colors.white),
                          color: const Color.fromARGB(255, 141, 139, 139),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            validator: (value) {
                              if(value!.isEmpty)
                                return "enter your email";
                            },
                            controller: _emailcontroller,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                hintText: 'enter you email',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(width: 1, color: Colors.white),
                          color: const Color.fromARGB(255, 141, 139, 139),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            validator: (value) {
                              if(value!.isEmpty)
                                return "enter your password";
                            },
                            obscureText: _isObscured,
                            controller: _passwordcontroller,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.security,
                                  color: Colors.white,
                                ),
                                hintText: 'enter password',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    TextButton(onPressed: () async {
                      if (_emailcontroller.text == "") {
                        return AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.bottomSlide,
                            title: 'Error',
                            desc:
                            'Please Enter an Email first!! ',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {})
                            .show();
                      } else {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(
                            email: _emailcontroller.text);
                        AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.bottomSlide,
                            title: 'Warning',
                            desc:
                            'Go to your email to reset password  ',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {})
                            .show();
                      }
                    },
                      child: Text("Forget password?",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: Colors.black,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          onPressed: () async {
                            if(formKey.currentState!.validate()) {
                              setState(() {
                                isLogin=true;
                              });
                             await auth.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text).then((value) {
                                auth.getCurrentUser()!.emailVerified?
                                defaultToast("Login Successful", Colors.green):
                                defaultToast("Verify your email first", Colors.deepOrangeAccent);
                                ;
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AuthGate(),), (route) => false,);
                              },).catchError((onError){
                                defaultToast("Username or Password is incorrect", Colors.red);
                              });
                              setState(() {
                                isLogin=false;
                              });
                            }
                          },
                          child: isLogin? CircularProgressIndicator(
                          ):Text(
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
                        Text(
                          "Don't have an account ?",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (BuildContext) {
                              return Register_Screen();
                            }));
                          },
                          child: Text(
                            "sign up",
                            style: TextStyle(fontSize: 15, color: Colors.orange),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Text(
                      "Alternatively login with:",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(width: 1, color: Colors.orange)),
                            child: Center(
                              child: Row(
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
                                    "Apple ID",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(width: 1, color: Colors.orange)),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  auth.signInWithGoogle();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/Google - png 0.png"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Google",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
