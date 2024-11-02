import 'package:commision_system/app/login/widgets/heardCard.dart';
import 'package:flutter/material.dart';

class AgentView extends StatefulWidget {
  const AgentView({super.key});

  @override
  State<AgentView> createState() => _AgentViewState();
}

class _AgentViewState extends State<AgentView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [HeaderCard(title: "Agency", showIcon: false)],
      ),
    );
  }
}
