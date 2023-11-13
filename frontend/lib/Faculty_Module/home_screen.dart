// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:frontend/Faculty_Module/main_screen.dart';

class Students {
  final String rollno;
  final String name;
  final String section;
  Students({
    required this.rollno,
    required this.name,
    required this.section,
  });
}

class FacultyHomeScreen extends StatefulWidget {
  const FacultyHomeScreen({super.key});
  @override
  State<FacultyHomeScreen> createState() {
    return _FacultyHomeScreenState();
  }
}

class _FacultyHomeScreenState extends State<FacultyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select section"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainScreen(
                        category: "CSE-A",
                      )));
            },
            child: Text('CSE-A'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainScreen(
                        category: "CSE-B",
                      )));
            },
            child: Text('CSE-B'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainScreen(
                        category: "CSE-C",
                      )));
            },
            child: Text('CSE-C'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainScreen(
                        category: "CSE-D",
                      )));
            },
            child: Text('CSE-D'),
          ),
        ],
      ),
    );
  }
}
