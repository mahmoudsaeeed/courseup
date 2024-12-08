import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.image, required this.title, required this.subtitle});
  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          const SizedBox(height: 60,),
          Image(image: AssetImage(image), fit: BoxFit.cover,),
          const SizedBox(height: 20,),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
          const SizedBox(height: 30,),
          Text(subtitle, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}