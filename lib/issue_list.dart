import 'package:flutter/material.dart';
import 'package:github_search_flutter/edit_issue.dart';
import 'package:github_search_flutter/issue_detail.dart';

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

class IssueListContent extends StatefulWidget {
  final String state;

  IssueListContent({required this.state});

  @override
  State<IssueListContent> createState() => _IssueListContentState();
}

class _IssueListContentState extends State<IssueListContent> {
  List<Map<String, dynamic>> openIssueSamples = [
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

  List<Map<String, dynamic>> closedIssueSamples = [
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

  void _deleteIssue(int index, String state) {
    setState(() {
      if (state == 'open') {
        openIssueSamples.removeAt(index);
      } else {
        closedIssueSamples.removeAt(index);
      }
    });
  }

  void _editIssue(int index, String state) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditIssue()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final issues =
        widget.state == 'open' ? openIssueSamples : closedIssueSamples;

    return ListView.builder(
      itemCount: issues.length,
      itemBuilder: (context, index) {
        final issue = issues[index];
        return IssueItem(
          issue: issue,
          onDelete: () => _deleteIssue(index, widget.state),
          onEdit: () => _editIssue(index, widget.state),
        );
      },
    );
  }
}

class IssueItem extends StatelessWidget {
  final Map<String, dynamic> issue;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  IssueItem({
    required this.issue,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IssueDetail()),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      issue['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'delete') {
                        onDelete();
                      } else if (value == 'edit') {
                        onEdit();
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(value: 'delete', child: Text('Delete')),
                        PopupMenuItem(value: 'edit', child: Text('Edit'))
                      ];
                    },
                  ),
                ],
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
      ),
    );
  }
}
