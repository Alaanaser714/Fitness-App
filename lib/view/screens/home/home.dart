// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:fitness_app/core/data/data_source/home_data.dart';
import 'package:flutter/material.dart';
import '../../../core/services/authentication/auth_service.dart';
import '../settings/setting_options/setting_options.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 29, 31, 33),
          centerTitle: true,
          title: const Text(
            "Home",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingOptions(),
                      ));
                },
                icon: const Icon(
                  Icons.settings,
                  size: 35,
                  color: Colors.white,
                ))
          ],
        ),
        body: ListView.builder(
          itemCount: homeList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(
                            homeList[index].image!,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      homeList[index].title!,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        );
  }
}
