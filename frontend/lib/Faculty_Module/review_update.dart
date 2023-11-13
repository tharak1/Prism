import 'package:flutter/material.dart';
import 'package:frontend/Faculty_Module/home_screen.dart';
import 'package:frontend/services/auth.dart';

class ReviewAndSubmitScreen extends StatefulWidget {
  const ReviewAndSubmitScreen({super.key, required this.selected});
  final List<String> selected;
  @override
  State<ReviewAndSubmitScreen> createState() {
    return _ReviewAndSubmitScreenState();
  }
}

class _ReviewAndSubmitScreenState extends State<ReviewAndSubmitScreen> {
  List<String> review = [];

  @override
  void initState() {
    super.initState();
    review = widget.selected;
  }

  void onRollnoSelected(bool? value, rollno) {
    if (value == true) {
      setState(() {
        review.add(rollno);
      });
    } else {
      setState(() {
        review.remove(rollno);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review And Submit"),
      ),
      body: Column(
        children: [
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: widget.selected.length,
                itemBuilder: (context, index) => CheckboxListTile(
                  value: review.contains(widget.selected[index]),
                  onChanged: (bool? value) {
                    onRollnoSelected(value, widget.selected[index]);
                  },
                  title: Text(widget.selected[index].toUpperCase()),
                  subtitle: const Text('Supporting text'),
                ),
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: ListView.builder(
                  itemCount: review.length,
                  itemBuilder: (context, index) => ElevatedButton(
                      onPressed: () {}, child: Text(review[index]))),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print(review);
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("Conformation"),
              content:
                  const Text("Click ok to Submit and go back to main page"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("cancel"),
                ),
                TextButton(
                  onPressed: () {
                    final Authservice authservice = Authservice();
                    authservice.sendMessages(rollnumbers: review);
                    Navigator.pop(context);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FacultyHomeScreen()),
                        (route) => false);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => FacultyHomeScreen()));
                  },
                  child: const Text("Okay"),
                ),
              ],
            ),
          );
        },
        label: Text("Submit"),
      ),
    );
  }
}
