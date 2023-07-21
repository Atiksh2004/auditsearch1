import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: SearchAssetPage(),
    );
  }
}

class SearchAssetPage extends StatelessWidget {
  const SearchAssetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Dealer'),
        centerTitle: true,
        leading: Row(
          children: [
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchAssetPage()),
                );
              },
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            icon: const Text('Back'),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
            child: const Row(
              children: [
                Text(
                  'Filter: ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      'Dealer No.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 380.0,
            height: 40.0,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter Dealer No.',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Reset'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  label: const Text('Search'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Search Results',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Asset No.',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Model',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          const Row(
            children: [
              Expanded(
                flex: 4,
                child: Text('TESTDEALER001'),
              ),
              Expanded(
                flex: 5,
                child: Text('Test Dealer 1'),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
            child: const ListTile(
              title: Text('TESTDEALER001\t \t \t \t \t \t \t \t Test Dealer 2'),
            ),
          ),
        ],
      ),
    );
  }
}
