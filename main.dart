import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TileData> tileDataList = [
    TileData(
      title: 'Barry Francis Pty Ltd',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'Audit No: STK104975',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Swanpride Pty Ltd',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'Audit No: STK105031',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Townsville Marine Pty Ltd',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'Audit No: STK105635',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Swanpride Pty Ltd',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'Audit No: STK105636',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Swanpride Pty Ltd',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'Audit No: STK105637',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Test Dealer 2',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'TESTAUDIT002',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Test Dealer 1',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'TESTAUDIT005',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Test Dealer 2',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'TESTAUDIT006',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Test Dealer 1',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'TESTAUDIT007',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Test Dealer 1',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'TESTAUDIT008',
      imagePath: 'images/yamaha.png',
    ),
  ];

  List<int> pendingUnitsList = [50, 68, 21, 22, 23, 22, 2, 2, 2, 2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audit List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            icon: const Text('Search'),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: tileDataList.length,
        itemBuilder: (context, index) {
          return _buildTile(tileDataList[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
            thickness: 1,
            height: 1,
          );
        },
      ),
    );
  }

  Widget _buildTile(TileData tileData) {
    List<int> pendingUnits = [50, 68, 21, 22, 23, 22, 2, 2, 2, 2];
    int index = tileDataList.indexOf(tileData);

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      horizontalTitleGap: 0,
      dense: true,
      leading: Image.asset(
        tileData.imagePath,
        width: 90,
        height: 90,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tileData.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(tileData.subtitle1),
                Text(tileData.subtitle2),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Pending',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Text(
                  '${pendingUnits[index]} units',
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward),
    );
  }
}

class TileData {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String imagePath;

  TileData({
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.imagePath,
  });
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Dealer'),
        centerTitle: true,
        leading: Row(
          children: [
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
              icon: const Text('Back'),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
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
                'Search Result',
                style: TextStyle(fontSize: 22.0),
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
                      'Dealer No.',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
                SizedBox(width: 35),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Trading Name',
                      style: TextStyle(fontSize: 18.0),
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
          const Text(
            'No Records Found',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
