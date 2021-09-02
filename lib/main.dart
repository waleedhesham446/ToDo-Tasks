import 'package:flutter/material.dart';
import './views/plan_creator_screen.dart';
import './plan_provider.dart';

void main() => runApp(PlanProvider(
      child: MasterPlanApp(),
    ));

class MasterPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: PlanCreatorScreen(),
    );
  }
}
