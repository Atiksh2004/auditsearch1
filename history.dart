import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: const HistoryPage(),
    );
  }
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
      title: 'Test Dealer 2',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'Audit No: TESTAUDIT002',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Test Dealer 1',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'Audit No: TESTAUDIT005',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Test Dealer 2',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'Audit No: TESTAUDIT006',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Test Dealer 1',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'Audit No: TESTAUDIT007',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Test Dealer 2',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'Audit No: TESTAUDIT008',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Test Dealer 3',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'Audit No: TESTAUDIT008',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Test Dealer 2',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'Audit No: TESTAUDIT008',
      imagePath: 'images/yamaha.png',
    ),
    TileData(
      title: 'Test Dealer 2',
      subtitle1: 'Wholesale and Retail Dealer',
      subtitle2: 'Audit No: TESTAUDIT008',
      imagePath: 'images/yamaha.png',
    ),
  ];

  List<int> pendingUnitsList = [50, 68, 21, 22, 23, 22, 2, 2, 2, 2, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HistoryPage()),
            );
          },
          icon: const Icon(Icons.qr_code),
        ),
        title: const Text('Audit History'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryPage()),
              );
            },
            icon: const Text('Back'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 20,
            child: ListView.separated(
              itemCount: tileDataList.length,
              shrinkWrap: true,
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
          ),
          Flexible(
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'LOAD MORE',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTile(TileData tileData) {
    List<String> dates = [
      '8/5/2023',
      '5/5/2023',
      '5/5/2023',
      '30/3/2023',
      '30/3/2023',
      '23/6/2023',
      '20/6/2023',
      '10/5/2023',
      '20/6/2023',
      '10/5/2023',
      '20/6/2023',
    ];
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
                const SizedBox(height: 8),
                Text(
                  tileData.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 3),
                Text(tileData.subtitle1),
                const SizedBox(height: 3),
                Text(tileData.subtitle2),
                const SizedBox(height: 7),
              ],
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Text(
                  dates[index],
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
