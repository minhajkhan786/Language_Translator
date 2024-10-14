import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class MenuOptions {
  static const List<String> options = [
    'About',
    'Settings',
    'Feedback',
  ];

  static void onSelect(BuildContext context, String option) {
    switch (option) {
      case 'About':
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('About'),
              content: Text('This is a language translation app.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        break;
      case 'Settings':
        // Implement your settings logic here
        break;
      case 'Feedback':
        _showFeedbackDialog(context);

        // Implement your feedback logic here
        break;
    }
  }
}

void _showFeedbackDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Feedback'),
        content: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'For feedback, please contact me at: ',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: 'your_email@gmail.com', // Replace with your email
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchEmail();
                  },
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _launchEmail() async {
  const email = 'minhajnbd7501@gmail.com'; // Replace with your email
  const subject = 'Feedback';
  const body = 'Please provide your feedback here...';

  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email,
    query: 'subject=$subject&body=$body',
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'Could not launch ${emailUri.toString()}';
  }
}
