import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_ford/resources/appcolors.dart';
import 'package:main_ford/resources/constants.dart';

class PayDetails extends StatelessWidget {
  const PayDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      contentTextStyle: const TextStyle(
        color: AppColors.black,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(color: AppColors.black),
              children: [
                TextSpan(
                  text: "Join the Main Ford app for just ",
                  style: TextStyle(),
                ),
                TextSpan(
                  text: "350 INR ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "and earn ",
                  style: TextStyle(),
                ),
                TextSpan(
                  text: "250 INR ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "cashback for every friend you refer! Simply send ",
                  style: TextStyle(),
                ),
                TextSpan(
                  text: "350 INR ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "to",
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          Constants.height15,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 225, 175, 253),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'mainfordmf@okaxis',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () async {
                    const String textToCopy = 'mainfordmf@okaxis';
                    if (textToCopy.isNotEmpty) {
                      try {
                        await Clipboard.setData(
                            const ClipboardData(text: textToCopy));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Copied to Clipboard!')),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Failed to copy to clipboard.'),
                          ),
                        );
                      }
                    }
                  },
                  icon: const Icon(Icons.copy),
                ),
              ],
            ),
          ),
          Constants.height15,
          const Text(
              'Upload a screenshot with payement screenshot to get started. Thanks for joining!'),
          Constants.height15,
          const Text(
              'For queries: mainfordmf@gmail.com'),
        ],
      ),
    );
  }
}
