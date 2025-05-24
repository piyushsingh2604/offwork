import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion Pie Chart Web',
      debugShowCheckedModeBanner: false,
      home: PieChartWeb(),
    );
  }
}

class PieChartWeb extends StatelessWidget {
  final List<ChartData> data = [
    ChartData('Apple', 71, Colors.red),
    ChartData('Orange', 55, Colors.orange),
    ChartData('Banana', 55, Colors.yellow),
    ChartData('Pineapple', 5, Colors.brown),
    ChartData('Grapes', 1, Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate total value
    final double total = data.fold(0, (sum, item) => sum + item.value);

    return Scaffold(
      appBar: AppBar(title: const Text("Pie Chart with Percentages")),
      body: Center(
        child: Container(
          height: 237,
          width: 237,
          child: SfCircularChart(
            margin: const EdgeInsets.all(20),
            title: ChartTitle(text: 'Basic Pie Chart'),
            series: <CircularSeries>[
              PieSeries<ChartData, String>(
                dataSource: data,
                xValueMapper: (ChartData d, _) => d.category,
                yValueMapper: (ChartData d, _) => d.value,
                pointColorMapper:
                    (ChartData d, _) => d.color, // Set slice color here
                // Show only percentage rounded to 1 decimal place
                dataLabelMapper:
                    (ChartData d, _) => '${((d.value)).toStringAsFixed(0)}',
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside,
                  connectorLineSettings: ConnectorLineSettings(
                    type: ConnectorType.curve,
                    length: '15%',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String category;
  final double value;
  final Color color; // Added color field

  ChartData(this.category, this.value, this.color);
}
