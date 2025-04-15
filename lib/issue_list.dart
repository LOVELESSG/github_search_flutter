import 'package:flutter/material.dart';

class IssueList extends StatefulWidget {
  const IssueList({super.key});

  @override
  State<IssueList> createState() => _IssueListState();
}

class _IssueListState extends State<IssueList> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class IssueListContent extends StatelessWidget {
  final String state;

  IssueListContent({super.key, required this.state});

  final List<Map<String, dynamic>> openIssueSamples = [
    {
      'title': 'Issue 1: Internet Error',
      'body': 'Description: In some network environments, the application cannot initiate requests normally, resulting in data loading failure.',
      'created_at': '2024-10-26T10:00:00Z',
      'comments': 1
    },
    {
      'title': 'Issue 2: UI rendering performance optimization',
      'body': 'Suggestion: Optimize list rendering performance to avoid lag when the amount of data is large.',
      'created_at': '2023-10-25T17:03:00Z',
      'comments': 2
    },
    {
      'title': 'Issue 3: New feature: User login',
      'body': 'Requirements: Implement user login function, support username and password login and third-party login.',
      'created_at': '2023-10-24T09:15:00Z',
      'comments': 3
    },
  ];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
