import 'package:flutter/material.dart';

import 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Title',
      home: const SettingScreen(),
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
    );
  }
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
          icon: const Icon(Icons.menu),
        ),
        title: const Text('Settings'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 10, 0),
          child: const ListTile(
            title: Text('Company: YMFAUS'),
            trailing: Icon(Icons.keyboard_arrow_down),
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 10, 0),
          child: const ListTile(
            title: Text('Finger Authentication'),
            trailing: Icon(Icons.toggle_off),
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 10, 0),
          child: const ListTile(
            title: Text('Clear Database'),
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 10, 0),
          child: const ListTile(
            title: Text('Export Audit'),
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ]),
    );
  }
}
