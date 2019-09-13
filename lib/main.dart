import 'package:flutter/material.dart';
import 'package:timesheet/layout/constants.dart';

void main() {
  runApp(TimesheetApp());
}

class TimesheetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timesheet App',
      home: HomeScreen(),
    );
  }
}

List<Task> entries = [
  Task(
    project: Project(name: "Kuunika"),
    description: "I was working on the Timesheet App with Nyemba",
    activity: Activity(name: "Development"),
    duration: ActivityDuration(start: DateTime(2019, 9, 13, 15, 0), end: DateTime(2019, 9, 13, 16, 0))
  ),
  Task(
      project: Project(name: "Kuunika"),
      description: "I was working on the something else",
      activity: Activity(name: "Development"),
      duration: ActivityDuration(start: DateTime(2019, 9, 13, 11, 0), end: DateTime(2019, 9, 13, 14, 0))
  )
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScreenContent(entries: entries,);
  }
}

class HomeScreenContent extends StatelessWidget {
  final List<Task> entries;

  HomeScreenContent({this.entries = const []});

  @override
  Widget build(BuildContext context) {
    return entries.isEmpty ? EmptyState(message: strings[appStrings.emptyEntries]) : _renderEntryList();
  }

  _renderEntryList() {
    return ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return TaskContainer(entry: entries[index]);
        });
  }
}

class TaskContainer extends StatelessWidget {
  final Task entry;

  TaskContainer({@required this.entry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        elevation: 2.0,
        child: Container(
          width: double.infinity,
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      entry.project.name,
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                            '${entry.duration.start.hour.toString()}:${entry.duration.start.minute.toString()}'),
                        Text('-'),
                        Text(
                            '${entry.duration.end.hour.toString()}:${entry.duration.end.minute.toString()}'),
                      ],
                    ),
                  ],
                ),
                Text(
                  entry.description,
                  style: Theme.of(context).textTheme.subtitle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  final String message;

  EmptyState({this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
        Text(this.message, key: Key('emptyStateMessage'),)
    );
  }
}


class ActivityDuration {
  final DateTime start;
  final DateTime end;

  ActivityDuration({this.start, this.end});
}

class Task {
  final Project project;
  final String description;
  final Activity activity;
  final ActivityDuration duration;

  Task({this.project, this.description, this.activity, this.duration});
}

class Project {
  final String name;
  final String description;

  Project({this.name, this.description = "Some Random Project"});
}

class Activity {
  final String name;
  final String description;

  Activity({this.name, this.description = "Some Randon Activity"});
}
