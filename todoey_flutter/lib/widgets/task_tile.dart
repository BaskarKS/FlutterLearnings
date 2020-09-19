import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;
  final Function longPressCallback;
  TaskTile(
      {this.taskTitle,
      this.isChecked,
      this.checkboxCallback,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: this.longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}

/*
class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool enableCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'this is a task',
        style: TextStyle(
          decoration: enableCheckBox ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckbox( // this widget is child of TaskTile widget, (TaskTile is parent of TaskCheckbox)
          checkboxState: enableCheckBox,
          toggleCheckBoxState: (bool value) {
            setState(() {
              enableCheckBox = value;
            });
          }),
    );
  }
}

// TaskCheckbox is one of child of TaskTile widget, but user interaction in TaskCheckBox widget determines the
// state of other children's of TaskTile widget, hence the state of user interaction of TaskCheckbox has to be
// pulled/moved up to parent(TaskTile) to update the state of other children's of TaskTile. This is called
// ' Lifting state-up', here we use function call-back mechanism to move the state-up.

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  Function toggleCheckBoxState;
  TaskCheckbox({this.checkboxState, this.toggleCheckBoxState});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: toggleCheckBoxState,
    );
  }
}
*/
