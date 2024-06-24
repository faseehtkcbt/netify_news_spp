import 'package:flutter/material.dart';
import 'package:news_app/core/color_pallette/app_pallette.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/utils/app_text.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
          text: 'Privacy Policy',
          textStyle: Theme.of(context).textTheme.titleMedium,
          textSize: 20,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      Constants
                          .appIcon, // Ensure you have the app logo image in your assets
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(height: 10),
                    AppText(
                      text: 'Netify App',
                      textStyle: Theme.of(context).textTheme.titleMedium,
                      textColor: AppPellete.themeColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              AppText(
                text: 'Privacy Policy',
                textStyle: Theme.of(context).textTheme.titleMedium,
                textSize: 18,
              ),
              const SizedBox(height: 10),
              AppText(
                text:
                    'Welcome to News App! We value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, and safeguard your information.',
                textStyle: Theme.of(context).textTheme.titleMedium,
                textSize: 14,
                fontWeight: FontWeight.w400,
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              AppText(
                text: '1. Information We Collect',
                textStyle: Theme.of(context).textTheme.titleMedium,
                textSize: 15,
              ),
              const SizedBox(height: 10),
              AppText(
                text:
                    'We collect information that you provide to us when you register for an account, such as your name, email address, and password. Additionally, we may collect information about your usage of the app, such as the articles you read and the features you use.',
                textStyle: Theme.of(context).textTheme.titleMedium,
                maxLines: 12,
                fontWeight: FontWeight.w400,
                textSize: 14,
              ),
              const SizedBox(height: 20),
              AppText(
                text: '2. How We Use Your Information',
                textStyle: Theme.of(context).textTheme.titleMedium,
                textSize: 15,
              ),
              const SizedBox(height: 10),
              AppText(
                text:
                    'We use your information to provide and improve our services, personalize your experience, and communicate with you about updates and promotions. We do not sell or share your personal information with third parties for their marketing purposes.',
                textStyle: Theme.of(context).textTheme.titleMedium,
                fontWeight: FontWeight.w400,
                maxLines: 12,
                textSize: 14,
              ),
              const SizedBox(height: 20),
              AppText(
                text: '3. Data Security',
                textStyle: Theme.of(context).textTheme.titleMedium,
                textSize: 16,
              ),
              const SizedBox(height: 10),
              AppText(
                text:
                    'We implement appropriate security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction. However, no data transmission over the internet or electronic storage is completely secure, so we cannot guarantee absolute security.',
                textStyle: Theme.of(context).textTheme.titleMedium,
                fontWeight: FontWeight.w400,
                maxLines: 12,
                textSize: 14,
              ),
              const SizedBox(height: 20),
              AppText(
                text: '4. Your Choices',
                textStyle: Theme.of(context).textTheme.titleMedium,
                textSize: 16,
              ),
              const SizedBox(height: 10),
              AppText(
                text:
                    'You have the right to access, update, and delete your personal information. You can also opt out of receiving promotional communications from us by following the instructions in those communications.',
                textStyle: Theme.of(context).textTheme.titleMedium,
                fontWeight: FontWeight.w400,
                maxLines: 12,
                textSize: 14,
              ),
              const SizedBox(height: 20),
              AppText(
                text: '5. Changes to This Privacy Policy',
                textStyle: Theme.of(context).textTheme.titleMedium,
                textSize: 16,
              ),
              const SizedBox(height: 10),
              AppText(
                text:
                    'We may update this Privacy Policy from time to time. We will notify you of any significant changes by posting the new Privacy Policy on our app. Your continued use of the app after the changes take effect signifies your acceptance of the revised Privacy Policy.',
                textStyle: Theme.of(context).textTheme.titleMedium,
                maxLines: 12,
                textSize: 14,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 20),
              AppText(
                text: 'Contact Us',
                textStyle: Theme.of(context).textTheme.titleMedium,
                textSize: 16,
              ),
              const SizedBox(height: 10),
              AppText(
                text:
                    'If you have any questions or concerns about this Privacy Policy, please contact us at support@netifyapp.com.',
                textStyle: Theme.of(context).textTheme.titleMedium,
                maxLines: 12,
                textSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
