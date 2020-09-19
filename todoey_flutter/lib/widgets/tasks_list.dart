import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/model/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task_data.dart';

class TasksList extends StatelessWidget {
// class TasksList extends StatefulWidget {
//  final List<Task> tasks;
//  TasksList({this.tasks});
//
//  @override
//  _TasksListState createState() => _TasksListState();
//  }
//
//  class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      // will consume the data shared by provider, we can use it to build our tree
      builder: (context, taskData, child) {
        // taskData is the data shared by provider in the parent, we can use it
        return ListView.builder(
            itemBuilder: (context, index) {
              //Task task = Provider.of<TaskData>(context).tasks[index];
              Task task = taskData.tasks[index];
              return TaskTile(
                  longPressCallback: () {
                    taskData.removeTask(task);
                  },
                  taskTitle:
                      taskData.getTaskName(index), // widget.tasks[index].name
                  isChecked: taskData
                      .getTaskState(index), // widget.tasks[index].isDone
                  checkboxCallback: (value) {
//              setState(() {
//                Provider.of<TaskData>(context).tasks[index].toggleDone();  // // widget.tasks[index].toggleDone()
//              });
                    taskData.updateTask(task);
                  });
            },
            itemCount: taskData.taskCount // widget.tasks.length
            );
      },
    );

    /*return ListView(
      children: [
        TaskTile(
          taskTitle: tasks[0].name,
          isChecked: tasks[0].isDone,
        ),
        TaskTile(
          taskTitle: tasks[1].name,
          isChecked: tasks[1].isDone,
        ),
      ],
    );*/
  }
}
// }
