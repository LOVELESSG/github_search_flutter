import 'package:flutter/material.dart';
import 'package:github_search_flutter/repo_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  var _searchText = '';
  final _items = [
    'flutter',
    'Kotlin',
    'Dart',
    'android',
    'Linux',
    'Debian',
    'mobian',
  ];
  var _searchResults = [];
  var _isSearching = false;

  void _updateSearch(String value) {
    setState(() {
      _searchText = value;
      if (_searchText.isEmpty) {
        _isSearching = false;
        _searchResults = [];
      }
    });
  }

  void _searchRepo(String value) {
    if (_searchText.isEmpty) return;

    setState(() {
      _isSearching = true;
      _searchResults =
          _items
              .where(
                (item) =>
                    item.toLowerCase().contains(_searchText.toLowerCase()),
              )
              .toList();
    });
  }

  void _stopSearching() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
      _searchText = '';
      _searchResults = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Repo Search',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        //backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: SearchBar(
              controller: _searchController,
              leading: const Icon(Icons.search),
              trailing: [
                if (_searchText.isNotEmpty)
                  IconButton(
                    onPressed: _stopSearching,
                    icon: const Icon(Icons.clear),
                  ),
              ],
              elevation: WidgetStateProperty.all(0),
              onChanged: _updateSearch,
              onSubmitted: _searchRepo,
            ),
          ),
          const SizedBox(height: 20.0),
          if (_isSearching)
            Expanded(
              child:
                  _searchResults.isEmpty
                      ? Center(
                        child: Text(
                          'No results found for "$_searchText"',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      )
                      : ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_searchResults[index]),
                            leading: Icon(Icons.book),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RepoDetail(),
                                ),
                              );
                            },
                          );
                        },
                      ),
            )
          else
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.folder_open, size: 60, color: Colors.grey[400]),
                    SizedBox(height: 16),
                    Text(
                      'Explore repositories',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
