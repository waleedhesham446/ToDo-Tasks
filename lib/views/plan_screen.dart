import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({Key key, this.plan}) : super(key: key);

  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  ScrollController scrollController;

  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final plan = PlanProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Plane: ${plan.name}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildList(),
          ),
          SafeArea(
            child: Text(plan.completenessMessage),
          ),
        ],
      ),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  Widget _buildAddTaskButton() {
    // final plan = PlanProvider.of(context);
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        final controller = PlanProvider.of(context);
        controller.createNewTask(plan);
        setState(() {});
      },
    );
  }

  Widget _buildList() {
    // final plan = PlanProvider.of(context);
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index]),
    );
  }

  Widget _buildTaskTile(Task task) {
    return Dismissible(
      key: ValueKey(task),
      background: Container(color: Colors.red),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        final controller = PlanProvider.of(context);
        controller.deleteTask(plan, task);
        setState(() {});
      },
      child: ListTile(
        leading: Checkbox(
          value: task.completed,
          onChanged: (selected) {
            setState(() {
              task.completed = selected;
            });
          },
        ),
        title: TextFormField(
          initialValue: task.description,
          onFieldSubmitted: ((text) {
            setState(() {
              task.description = text;
            });
          }),
        ),
      ),
    );
  }
}
