// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFFAF2FD),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFA8D5F4),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Schoodule',
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const TotalContainer(
                  bgColor: Color(0xFFF96D6C),
                  name: '월요일',
                ),
                const SizedBox(
                  height: 50,
                ),
                const TotalContainer(
                  bgColor: Color(0xFFFFD082),
                  name: '화요일',
                ),
                const SizedBox(
                  height: 50,
                ),
                const TotalContainer(
                  bgColor: Color(0xFF7EC0B2),
                  name: '수요일',
                ),
                const SizedBox(
                  height: 50,
                ),
                const TotalContainer(
                  bgColor: Color(0xFFF96D6C),
                  name: '목요일',
                ),
                const SizedBox(
                  height: 50,
                ),
                const TotalContainer(
                  bgColor: Color(0xFFFFD082),
                  name: '금요일',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TotalContainer extends StatelessWidget {
  final Color bgColor;
  final String name;

  const TotalContainer({
    required this.name,
    required this.bgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WeekContainer(
          name: name,
          bgColor: bgColor,
        ),
        const SizedBox(
          height: 10,
        ),
        SubjectContainer(
          bgColor: bgColor,
        ),
      ],
    );
  }
}

class SubjectContainer extends StatelessWidget {
  final Color bgColor;

  const SubjectContainer({
    required this.bgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: Column(
          children: [
            SubjectCancelRow(
              bgColor: bgColor,
            ),
            SubjectCancelRow(
              bgColor: bgColor,
            ),
            SubjectCancelRow(
              bgColor: bgColor,
            ),
            SubjectCancelRow(
              bgColor: bgColor,
            ),
            SubjectCancelRow(
              bgColor: bgColor,
            ),
            SubjectCancelRow(
              bgColor: bgColor,
            ),
            SubjectCancelRow(
              bgColor: bgColor,
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectCancelRow extends StatefulWidget {
  const SubjectCancelRow({
    super.key,
    required this.bgColor,
  });

  final Color bgColor;

  @override
  State<SubjectCancelRow> createState() => _SubjectCancelRowState();
}

class _SubjectCancelRowState extends State<SubjectCancelRow> {
  bool cancel = true;
  final TextEditingController _editingController = TextEditingController();
  String submitText = '';
  bool basic = true;

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  void onClickCancel() {
    setState(() {
      cancel = false;
      basic = false;
    });
  }

  void onSubmitted(String value) {
    setState(() {
      submitText = value;
      cancel = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        cancel
            ? Text(
                basic ? '과목' : submitText,
                style:
                    const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              )
            : Expanded(
                child: TextField(
                  controller: _editingController,
                  onSubmitted: onSubmitted,
                  decoration: InputDecoration(
                    labelText: '과목을 입력하세요.',
                    labelStyle: const TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.bgColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
        Transform.scale(
          scale: 1.5,
          child: IconButton(
            color: widget.bgColor,
            onPressed: onClickCancel,
            icon: const Icon(Icons.change_circle),
            iconSize: 20,
          ),
        )
      ],
    );
  }
}

class WeekContainer extends StatelessWidget {
  final String name;
  final Color bgColor;

  const WeekContainer({
    super.key,
    required this.name,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
