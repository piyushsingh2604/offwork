import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Auto Scroll and Focus Example')),
        body: AutoScrollForm(),
      ),
    );
  }
}

class AutoScrollForm extends StatefulWidget {
  @override
  _AutoScrollFormState createState() => _AutoScrollFormState();
}

class _AutoScrollFormState extends State<AutoScrollForm> {
  // Focus nodes for each TextField (manually created)
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();
  final FocusNode _focusNode7 = FocusNode();
  final FocusNode _focusNode8 = FocusNode();
  final FocusNode _focusNode9 = FocusNode();
  final FocusNode _focusNode10 = FocusNode();

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    // Dispose the focus nodes
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    _focusNode6.dispose();
    _focusNode7.dispose();
    _focusNode8.dispose();
    _focusNode9.dispose();
    _focusNode10.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              focusNode: _focusNode1,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_focusNode2);
                _scrollToNextField();
              },
              decoration: InputDecoration(
                labelText: 'TextField 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              focusNode: _focusNode2,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_focusNode3);
                _scrollToNextField();
              },
              decoration: InputDecoration(
                labelText: 'TextField 2',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              focusNode: _focusNode3,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_focusNode4);
                _scrollToNextField();
              },
              decoration: InputDecoration(
                labelText: 'TextField 3',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              focusNode: _focusNode4,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_focusNode5);
                _scrollToNextField();
              },
              decoration: InputDecoration(
                labelText: 'TextField 4',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              focusNode: _focusNode5,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_focusNode6);
                _scrollToNextField();
              },
              decoration: InputDecoration(
                labelText: 'TextField 5',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              focusNode: _focusNode6,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_focusNode7);
                _scrollToNextField();
              },
              decoration: InputDecoration(
                labelText: 'TextField 6',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              focusNode: _focusNode7,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_focusNode8);
                _scrollToNextField();
              },
              decoration: InputDecoration(
                labelText: 'TextField 7',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              focusNode: _focusNode8,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_focusNode9);
                _scrollToNextField();
              },
              decoration: InputDecoration(
                labelText: 'TextField 8',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              focusNode: _focusNode9,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_focusNode10);
                _scrollToNextField();
              },
              decoration: InputDecoration(
                labelText: 'TextField 9',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              focusNode: _focusNode10,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                FocusScope.of(context).unfocus(); // Dismiss keyboard
              },
              decoration: InputDecoration(
                labelText: 'TextField 10',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("data")),
          ],
        ),
      ),
    );
  }

  void _scrollToNextField() {
    // Scroll to the next TextField if needed
    _scrollController.animateTo(
      _scrollController.offset + 60.0, // Adjust scroll amount as needed
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
