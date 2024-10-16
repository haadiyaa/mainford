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
        title: const Text('Contact Us'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Main Ford – your gateway to seamless learning and exciting rewards!',
                style: MyTextStyles.appBartextSmall,
              ),
              Constants.height20,
              Text(
                  'At Main Ford, we aim to empower individuals through an innovative platform where learning meets opportunity. By registering with us, users gain access to a range of educational resources, including video-based learning classes, while also benefiting from our rewarding referral program.'),
              Constants.height15,
              AboutUsWidget(
                title: 'Our Vision',
                desc:
                    'We believe in making education accessible to everyone while creating opportunities for growth and financial rewards. With our user-friendly app, you can enhance your skills, refer others to the platform, and earn rewards through our referral system.',
              ),
              Constants.height15,
              AboutUsWidget(
                title: 'How It Works',
                desc:
                    'To get started, simply register by making a one-time payment of ₹350. Once registered, your account will be reviewed by our admin. After approval, you\'ll receive a password via email to access your account. Share your unique referral code with others, and for every successful referral, you’ll earn ₹250 as a reward.',
              ),
              Constants.height15,
              AboutUsWidget(
                title: 'Withdraw Earnings',
                desc:
                    'You can easily withdraw your earned balance by sending a withdrawal request through the app. Once approved by the admin, your requested amount will be transferred directly to you.',
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
