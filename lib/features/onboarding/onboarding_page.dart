import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.image, required this.title, required this.subtitle});
  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image(image: AssetImage(image)),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
          const SizedBox(height: 15,),
          Text(subtitle, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}