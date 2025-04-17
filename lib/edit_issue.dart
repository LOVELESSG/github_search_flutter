import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class EditIssue extends StatefulWidget {
  const EditIssue({super.key});

  @override
  State<EditIssue> createState() => _EditIssueState();
}

class _EditIssueState extends State<EditIssue> {
  QuillController _controller = QuillController.basic();
  TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Issue'),
        actions: [IconButton(onPressed: () {
          _saveIssue();
          Navigator.pop(context);
        }, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Issue Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Issue Content:'),
            QuillSimpleToolbar(
              controller: _controller,
              config: const QuillSimpleToolbarConfig(),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: QuillEditor.basic(controller: _controller),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveIssue() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Issue saved successfully!')));
  }
}
