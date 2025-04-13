import 'package:flutter/material.dart';
import 'package:github_search_flutter/components/rounded_image_container.dart';

class RepoDetail extends StatelessWidget {
  const RepoDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.bug_report),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RoundedImageContainer(height: 200, borderRadius: 12.0),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    //Expanded(child: child)
                    CircleAvatar(
                      radius: 24.0,
                      backgroundColor: Colors.grey[300],
                      child: Text('A'),
                    ),
                    SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          style: Theme.of(context).textTheme.titleLarge,
                          "Repo Title",
                        ),
                        Text(
                          style: Theme.of(context).textTheme.titleSmall,
                          "Repo Owner",
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [Icon(Icons.star_border), Text('0')],
                          ),
                          SizedBox(width: 8.0),
                          Column(children: [Icon(Icons.call_split), Text('0')]),
                          SizedBox(width: 8.0),
                          Column(
                            children: [
                              Icon(Icons.remove_red_eye_outlined),
                              Text('0'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  style: Theme.of(context).textTheme.bodyLarge,
                  'Wikipedia is a free-content online encyclopedia, written and maintained by a community of volunteers, known as Wikipedians, through open collaboration and the wiki software MediaWiki. Founded by Jimmy Wales and Larry Sanger on January 15, 2001, Wikipedia has been hosted since 2003 by the Wikimedia Foundation, an American nonprofit organization funded mainly by donations from readers.Wikipedia is the largest and most-read reference work in history.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
