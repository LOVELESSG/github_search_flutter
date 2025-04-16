import 'package:flutter/material.dart';

class IssueList extends StatefulWidget {
  const IssueList({super.key});

  @override
  State<IssueList> createState() => _IssueListState();
}

class _IssueListState extends State<IssueList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Github Issues'),
          bottom: TabBar(
            tabs: [Tab(text: 'Open Issues'), Tab(text: 'Closed Issues')],
          ),
        ),
        body: TabBarView(
          children: [
            IssueListContent(state: 'open'),
            IssueListContent(state: 'closed'),
          ],
        ),
      ),
    );
  }
}

class IssueListContent extends StatelessWidget {
  final String state;

  IssueListContent({super.key, required this.state});

  final List<Map<String, dynamic>> openIssueSamples = [
    {
      'title': 'Issue 1: Internet Error',
      'body':
          'Description: In some network environments, the application cannot initiate requests normally, resulting in data loading failure.',
      'created_at': '2024-10-26T10:00:00Z',
      'comments': 1,
    },
    {
      'title': 'Issue 2: UI rendering performance optimization',
      'body':
          'Suggestion: Optimize list rendering performance to avoid lag when the amount of data is large.',
      'created_at': '2023-10-25T17:03:00Z',
      'comments': 2,
    },
    {
      'title': 'Issue 3: New feature: User login',
      'body':
          'Requirements: Implement user login function, support username and password login and third-party login.',
      'created_at': '2023-10-24T09:15:00Z',
      'comments': 3,
    },
  ];

  final List<Map<String, dynamic>> closedIssueSamples = [
    {
      'title': 'Issue 4:  Fixed crash issues',
      'body':
          'Solution: Fixed an issue where the app might crash during certain operations.',
      'created_at': '2023-10-20T11:45:00Z',
      'comments': 3,
    },
    {
      'title': 'Issue 5:  Optimized page loading speed',
      'body':
          'Improvement: Improved page loading speed by optimizing code logic and resource loading methods.',
      'created_at': '2023-10-20T11:45:00Z',
      'comments': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final issues = state == 'open' ? openIssueSamples : closedIssueSamples;

    return ListView.builder(
      itemCount: issues.length,
      itemBuilder: (context, index) {
        final issue = issues[index];
        return IssueItem(issue: issue);
      },
    );
  }
}

class IssueItem extends StatelessWidget {
  final Map<String, dynamic> issue;

  IssueItem({required this.issue});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              issue['title'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              issue['body'] != null && issue['body'].isNotEmpty
                  ? issue['body'].split('\n').first
                  : 'No description',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Created: ${DateTime.parse(issue['created_at']).toLocal().toString().split(' ').first}',
                ),
                Text('Comments: ${issue['comments']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
