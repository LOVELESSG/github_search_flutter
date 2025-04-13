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
  var _items = [
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
    });
  }

  void _searchRepo(String value) {
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
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 200.0),
            Text(
              'Repo Search',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SearchBar(
              controller: _searchController,
              hintText: 'Search...',
              onChanged: _updateSearch,
              onSubmitted: _searchRepo,
              leading: const Icon(Icons.search),
              trailing: [
                IconButton(
                  onPressed: _stopSearching,
                  icon: const Icon(Icons.clear),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            if (_isSearching)
              for (int i = 0; i < _searchResults.length; i++)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RepoDetail(),
                      ),
                    );
                  },
                  child: Text(_searchResults[i]),
                )
            /*Column(
                children: <Widget>[
                  //for (int i = 0; i<_searchResults.length; i++) Text(_searchResults[i]),
                  ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text(_searchResults[index], style: Theme.of(context).textTheme.headlineLarge,));
                    },
                  ),
                ],
              )*/
            else
              Text('data'),
            /*_isSearching && _searchResults.isNotEmpty
                ? Text(_searchResults.length.toString())
                : Text('data'),*/
          ],
        ),
      ),
    );
  }
}
