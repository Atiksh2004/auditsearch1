import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'NavBar.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const ChartPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  late List<TaskData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SfCircularChart(
              title: ChartTitle(text: 'Audit Summary'),
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
                DoughnutSeries<TaskData, String>(
                  dataSource: _chartData,
                  xValueMapper: (TaskData data, _) => data.status,
                  yValueMapper: (TaskData data, _) => data.num,
                  dataLabelSettings: const DataLabelSettings(isVisible: false),
                  enableTooltip: true,
                  pointColorMapper: (TaskData data, _) {
                    if (data.status == 'Pending') {
                      return Colors.pink;
                    } else if (data.status == 'Completed') {
                      return Colors.orange;
                    } else if (data.status == 'Saved As Draft') {
                      return Colors.green;
                    }
                    return Colors.grey;
                  },
                  startAngle: 90,
                  endAngle: 450,
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 43.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTabItem('Pending', '8', Colors.pink),
                    _buildTabItem('Completed', '8', Colors.orange),
                    _buildTabItem('Saved As Draft', '0', Colors.green),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2.0,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      List<IconData> iconList = [
                        Icons.credit_card,
                        Icons.qr_code,
                        Icons.search,
                        Icons.search,
                        Icons.check_box,
                        Icons.history,
                      ];

                      List<Color> colorList = [
                        Colors.red,
                        Colors.blue,
                        Colors.orange,
                        Colors.green,
                        Colors.red,
                        Colors.blue,
                      ];

                      List<String> labelList = [
                        'Audit List',
                        'Scan',
                        'Search Dealer',
                        'Search Asset',
                        'Reminders',
                        'Audit History',
                      ];

                      return Column(
                        children: [
                          Icon(
                            iconList[index],
                            color: colorList[index],
                          ),
                          Text(
                            labelList[index],
                            style: TextStyle(
                              color: colorList[index],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, String value, Color textColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4.0),
            Text(
              value,
              style: TextStyle(
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  List<TaskData> getChartData() {
    final List<TaskData> chartData = [
      TaskData('Pending', 8),
      TaskData('Completed', 8),
      TaskData('Saved As Draft', 0),
    ];
    return chartData;
  }
}

class TaskData {
  TaskData(this.status, this.num);
  final String status;
  final int num;
}
