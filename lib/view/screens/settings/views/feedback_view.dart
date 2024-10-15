import 'package:fitness_app/core/services/authentication/auth_service.dart';
import 'package:fitness_app/core/shared/componans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({super.key});

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  AuthService auth = AuthService();

  var controller = TextEditingController();

  double stars = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
         centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.orange),
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        title: const Text(
          'Feedback',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'We appreciate your feedback!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            const Text(
              'Rate us:',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            RatingBar.builder(
              initialRating: stars,
              minRating: 0.5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40.0,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (value) {
                stars = value;
                setState(() {});
              },
              unratedColor: Colors.grey,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            const Text(
              'Your Comments:',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            TextField(
              controller: controller,
              maxLines: 5,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Type your feedback here...',
                hintStyle: TextStyle(color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                setState(() {
                  if (controller.text.isNotEmpty || stars != 0) {
                    defaultToast('Feedback Saved😊', Colors.pinkAccent);
                    controller.text = '';
                    stars = 0;
                  }
                });
              },
              child: const Text('Submit Feedback',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
