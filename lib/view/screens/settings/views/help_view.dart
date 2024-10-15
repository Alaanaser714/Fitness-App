import 'package:fitness_app/view/screens/settings/views/feedback_view.dart';
import 'package:flutter/material.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.orange),
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        title: const Text(
          'Help & Support',
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
              'For help, contact us:',
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
              'Email:abdulrahman.e.f22@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              'Phone: +20 109 198 0334',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            const ExpansionTile(
              title: Text('How do I reset my password?',
                  style: TextStyle(color: Colors.white)),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'To reset your password, go to Settings > Account > Password.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            const ExpansionTile(
              title: Text('Where can I find the user guide?',
                  style: TextStyle(color: Colors.white)),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'The user guide can be found at our official website under the Documentation section.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FeedbackView(),
                    ),
                  );
                },
                child: const Text('Submit Feedback',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
