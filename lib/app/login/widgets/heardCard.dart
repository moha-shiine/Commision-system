import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';

class HeaderCard extends StatelessWidget {
  final String? title;
  final bool showIcon; // New boolean parameter to control icon visibility

  const HeaderCard({
    super.key,
    required this.title,
    required this.showIcon, // Default to true if not specified
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              if (showIcon) // Display the icon only if showIcon is true
                const Icon(IconlyLight.home),
              if (showIcon) const Gap(10),
              Text(
                title ?? '',
                style: const TextStyle(color: Colors.black),
              ),
              const Gap(50),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: VerticalDivider(),
              ),
              const Gap(10),
              const Icon(IconlyBold.home, color: Colors.blue),
              const Gap(10),
              const Text(
                "Paid",
                style: TextStyle(color: Colors.blue),
              ),
              const Gap(30),
              const Icon(
                IconlyLight.paper,
                color: Colors.grey,
              ),
              const Gap(10),
              const Text(
                "UnPaid",
                style: TextStyle(color: Colors.grey),
              ),
              const Spacer(),
              const Text("Eng"),
              const Gap(10),
              const Icon(Icons.notification_add),
              const Gap(10),
              const Text("shiine"),
              const Gap(30),
              const CircleAvatar(
                  maxRadius: 30, child: Center(child: Icon(Icons.person))),
            ],
          ),
        ),
      ),
    );
  }
}
