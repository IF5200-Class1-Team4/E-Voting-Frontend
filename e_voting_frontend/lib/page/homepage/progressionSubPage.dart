import 'package:e_voting_frontend/voting/candidate.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:e_voting_frontend/voting/event.dart';
import 'package:flutter/material.dart';

class ProgressionSubPage extends StatefulWidget {
  final VotingEvent event;
  const ProgressionSubPage({Key? key, required this.event}) : super(key: key);

  @override
  State<ProgressionSubPage> createState() => _ProgressionSubPageState();
}

class _ProgressionSubPageState extends State<ProgressionSubPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(20.0),),
        Align(
            alignment: Alignment.topLeft,
            child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              const Icon(Icons.how_to_vote),
              const Text('Election :'),
              Text(widget.event.name),
              const Padding(padding: EdgeInsets.all(20.0),),
            ],
          ),
        ),
        
        Align(
            alignment: Alignment.topLeft,
            child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              const Icon(Icons.calendar_month),
              const Text('Start Date :'),
              Text(widget.event.startDate),
              const Padding(padding: EdgeInsets.all(20.0),),
            ],
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              const Icon(Icons.calendar_month),
              const Text('End Date :'),
              Text(widget.event.endDate),
              const Padding(padding: EdgeInsets.all(20.0),),
            ],
          ),
        ),
        Expanded(child: BarChartWidget(candidateList: widget.event.candidateList)),
      ],
    );
  }
}

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({Key? key, required this.candidateList}) : super(key: key);

  final List<Candidate> candidateList;

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState(candidateList: this.candidateList);
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final List<Candidate> candidateList;

  _BarChartWidgetState({required this.candidateList});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: BarChart(
        BarChartData(
            barGroups: _chartGroups(),
            borderData: FlBorderData(
                border: const Border(bottom: BorderSide(), left: BorderSide())),
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(sideTitles: _bottomTitles),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
          ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    return candidateList.map((candidate) =>
      BarChartGroupData(
        x: candidate.id,
        barRods: [
          BarChartRodData(
            toY: candidate.votes.toDouble()
          )
        ]
      )

    ).toList();
  }

  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      for (var candidate in candidateList) {
        if(value.toInt() == candidate.id){
          text = candidate.name;
          break;
        }
      }
      return Text(text);
    },
  );

  SideTitles get _leftTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      return Text(value.toString());
    },
  );
}