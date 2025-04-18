import 'package:flutter/material.dart';
import 'package:github_search_flutter/edit_comment.dart';

class IssueDetail extends StatefulWidget {
  final Map<String, dynamic> issue = {
    'author': 'octocat',
    'title': 'Found a bug!',
    'body':
        'When I click the button, the app crashes. This happens every time, even after restarting the app.',
    'created_at': '2023-10-27T10:00:00Z',
  };

  final List<Map<String, dynamic>> initialComments = [
    {
      'id': 1,
      'author': 'anotheruser',
      'body': 'I can confirm this bug. It also happens on my device.',
      'created_at': '2023-11-27T12:00:00Z',
    },
    {
      'id': 2,
      'author': 'octocat',
      'body': 'Thanks for the confirmation. We will investigate.',
      'created_at': '2023-12-27T14:00:00Z',
    },
  ];

  @override
  State<IssueDetail> createState() => _IssueDetailState();
}

class _IssueDetailState extends State<IssueDetail> {
  late List<Map<String, dynamic>> comments;

  @override
  void initState() {
    super.initState();
    comments = List.from(widget.initialComments);
  }

  void _deleteComment(int id) {
    setState(() {
      comments.removeWhere((comment) => comment['id'] == id);
    });
  }

  void _editComment(Map<String, dynamic> comment) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditComment()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Issue #${widget.issue['title']}')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${widget.issue['author']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(widget.issue['body']),
            SizedBox(height: 8.0),
            Text(
              'Created at: ${DateTime.parse(widget.issue['created_at']).toLocal().toString().split(' ').first}',
              style: TextStyle(color: Colors.grey),
            ),
            Divider(height: 32.0, thickness: 2.0),
            Text(
              'Comments:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Column(
              children:
                  comments.map((comment) {
                    return CommentItem(
                      key: ValueKey(comment['id']),
                      comment: comment,
                      onDelete: () => _deleteComment(comment['id']),
                      onEdit: () => _editComment(comment),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final Map<String, dynamic> comment;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const CommentItem({
    Key? key,
    required this.comment,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${comment['author']}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'delete') {
                        onDelete();
                      } else if (value == 'edit') {
                        onEdit();
                      }
                    },
                    itemBuilder:
                        (BuildContext context) => <PopupMenuItem<String>>[
                          const PopupMenuItem<String>(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                        ],
                  ),
                ],
              ),
              SizedBox(height: 4.0),
              Text(comment['body']),
              SizedBox(height: 4.0),
              Text(
                'Created at: ${DateTime.parse(comment['created_at']).toLocal().toString().split(' ').first}',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
