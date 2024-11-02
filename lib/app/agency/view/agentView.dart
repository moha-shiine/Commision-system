import 'package:commision_system/app/login/widgets/heardCard.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../home/widgets/datatable.dart';

class AgentView extends StatefulWidget {
  const AgentView({super.key});

  @override
  State<AgentView> createState() => _AgentViewState();
}

class _AgentViewState extends State<AgentView> {
  @override
  Widget build(BuildContext context) {
    final List<User> users = List.generate(
      50,
      (index) =>
          User('0$index', 'User $index', 'Adwaar Technology$index', '1$index'),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderCard(title: "Agency", showIcon: false),
          UserTable(
            users: users,
          )
        ],
      ),
    );
  }
}
