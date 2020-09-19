import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:todoey_flutter/model/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/task_data.dart';

/*class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {*/

class TasksScreen extends StatelessWidget {
  // as the provider supply the state, no need to be stateful-widget

  // bellow 'tasks' property is  'Lifted state-up' from 'TasksList' screen in-order to share the 'tasks'
  // property between 'TasksList' and 'AddTaskScreen', we have to place the 'tasks' in this TasksScreenWidget.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks', //'${Provider.of<TaskData>(context).tasks.length} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(
                  // tasks: widget.tasks,
                  ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          // this will show a material widget of bottom sheet slides in from bottom
          // Modal Bottom sheet will disable the other area of the screen and
          // active area is only the bottom sheet
          showModalBottomSheet(
            context: context,
            isScrollControlled:
                true, // to allow the bottom sheet to reach till top of screen and allow it to contain a scroll child
            builder: (context) => SingleChildScrollView(
              // to get current active screen location of pixel just above keyboard, we give padding bottom to that value
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskScreen(),
/*              child: AddTaskScreen(addTaskCallback: (newTaskTitle) {
//                setState(() {
//                  widget.tasks.add(Task(name: newTaskTitle));
//                });
                Provider.of<TaskData>(context).addTask(newTaskTitle);
                Navigator.pop(context);
              }), // this child doesn't contain too many child's for scrolling*/
            ),
          );
        },
      ),
    );
  }
}
