import 'package:flutter/material.dart';
import 'package:main_ford/resources/constants.dart';
import 'package:main_ford/resources/mytextstyles.dart';
import 'package:main_ford/view/view/contactus/widgets/aboutuswidget.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Main Ford',
                style: MyTextStyles.appBartextSmall,
              ),
              Constants.height20,
              Text(
                  'At Main Ford, we offer educational resources through video-based learning and a rewarding referral program.'),
              Constants.height15,
              // AboutUsWidget(
              //   title: 'Our Vision',
              //   desc:
              //       'We believe in making education accessible to everyone while creating opportunities for growth and financial rewards. With our user-friendly app, you can enhance your skills, refer others to the platform, and earn rewards through our referral system.',
              // ),
              // Constants.height15,
              AboutUsWidget(
                title: 'How It Works',
                desc:
                    'Register with a one-time payment of ₹350. After admin approval, you’ll receive a password via email to log in. Share your referral code to earn ₹250 for every successful referral.',
              ),
              Constants.height15,
              AboutUsWidget(
                title: 'Withdraw Earnings',
                desc:
                    'Easily request a withdrawal of your earned balance through the app. Once approved by the admin, the amount will be sent to you.',
              ),
              Constants.height15,
              AboutUsWidget(
                title: 'Contact Us',
                desc:
                    'We are always here to assist you. If you have any questions, concerns, or feedback, feel free to contact our support team.',
              ),
              Constants.height15,
              Text('Phone: +91 8086651002'),
              Constants.height5,
              Text('Email Id: mainfordmf@gmail.com'),
            ],
          ),
        ),
      ),
    );
  }
}
