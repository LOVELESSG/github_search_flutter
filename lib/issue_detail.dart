import 'package:flutter/material.dart';

class IssueDetail extends StatelessWidget {
  final Map<String, dynamic> issue = {
    'author': 'octocat',
    'title': 'Found a bug!',
    'body':
        'When I click the button, the app crashes. This happens every time, even after restarting the app.',
    'created_at': '2023-10-27T10:00:00Z',
  };

  final List<Map<String, dynamic>> comments = [
    {
      'author': 'anotheruser',
      'body': 'I can confirm this bug. It also happens on my device.',
      'created_at': '2023-10-27T12:00:00Z',
    },
    {
      'author': 'octocat',
      'body': 'Thanks for the confirmation. We will investigate.',
      'created_at': '2023-10-27T14:00:00Z',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Issue #${issue['title']}')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${issue['author']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(issue['body']),
            SizedBox(height: 8.0),
            Text(
              'Created at: ${DateTime.parse(issue['created_at']).toLocal().toString().split(' ').first}',
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
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${comment['author']}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4.0),
                                Text(comment['body']),
                                SizedBox(height: 4.0),
                                Text(
                                  'Created at: ${DateTime.parse(issue['created_at']).toLocal().toString().split(' ').first}',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
