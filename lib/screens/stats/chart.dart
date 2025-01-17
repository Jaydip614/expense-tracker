import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TransactionChart extends StatefulWidget {
  const TransactionChart({super.key});

  @override
  State<TransactionChart> createState() => _TransactionChartState();
}

class _TransactionChartState extends State<TransactionChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
    );
  }

  BarChartGroupData makeGroupData(int x, double y){
    return BarChartGroupData(
        x: x,
        barRods: [
          BarChartRodData(
              toY: y,
              width: 8,
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.tertiary,
                ],
                transform: const GradientRotation(pi / 40),
              ),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 5.2,
                color: Colors.grey.shade300,
              ),
          ),
        ]
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(8, (index) {
    switch(index){
      case 0: return makeGroupData(0,2);
      case 1: return makeGroupData(1,3);
      case 2: return makeGroupData(2,2);
      case 3: return makeGroupData(3,4.5);
      case 4: return makeGroupData(4,3.8);
      case 5: return makeGroupData(5,1.5);
      case 6: return makeGroupData(6,4);
      case 7: return makeGroupData(7,3.8);
      default: return throw Error();
    }
  },);

  BarChartData mainBarData(){
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
            getTitlesWidget: getLeftTitles,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 50,
              getTitlesWidget: getBottomTitles,
          ),
        ),
      ),
      borderData: FlBorderData(show: false,),
      gridData: const FlGridData(show: false,),
      barGroups: showingGroups(),
    );
  }

  Widget getBottomTitles(double value, TitleMeta meta){
    const style = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    );

    Widget text;

    switch(value){
      case 0:
        text = const Text("01", style: style,);
        break;
      case 1:
        text = const Text("02", style: style,);
        break;
      case 2:
        text = const Text("03", style: style,);
        break;
      case 3:
        text = const Text("04", style: style,);
        break;
      case 4:
        text = const Text("05", style: style,);
        break;
      case 5:
        text = const Text("06", style: style,);
        break;
      case 6:
        text = const Text("07", style: style,);
        break;
      case 7:
        text = const Text("08", style: style,);
        break;
      default:
        text = const Text('', style: style,);
        break;
    }

    return SideTitleWidget(axisSide: meta.axisSide, space: 12,child: text,);
  }

  Widget getLeftTitles(double value, TitleMeta meta){
    const style = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    );

    String text;

    if(value == 0){
      text = '\$0K';
    }
    else if(value == 1){
      text = '\$1K';
    }
    else if(value == 2){
      text = '\$2K';
    }
    else if(value == 3){
      text = '\$3K';
    }
    else if(value == 4){
      text = '\$4K';
    }
    else if(value == 5){
      text = '\$5K';
    }
    else {
      return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style,),
    );
  }
}
