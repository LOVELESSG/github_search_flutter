import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class EditComment extends StatefulWidget {
  const EditComment({super.key});

  @override
  State<EditComment> createState() => _EditCommentState();
}

class _EditCommentState extends State<EditComment> {
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
        title: Text('Edit Comment'),
        actions: [
          IconButton(
            onPressed: () {
              _saveIssue();
              Navigator.pop(context);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  QuillSimpleToolbar(
                    controller: _controller,
                    config: const QuillSimpleToolbarConfig(),
                  ),
                ],
              ),
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
    ).showSnackBar(SnackBar(content: Text('Change saved successfully!')));
  }
}
