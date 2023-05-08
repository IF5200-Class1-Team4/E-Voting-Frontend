import 'package:e_voting_frontend/voting/candidate.dart';
import 'package:e_voting_frontend/voting/event.dart';
import 'package:flutter/material.dart';

class VoteSubPage extends StatefulWidget {
  final VotingEvent event;
  const VoteSubPage({Key? key, required this.event}) : super(key: key);

  @override
  State<VoteSubPage> createState() => _VoteSubPageState();
}

class _VoteSubPageState extends State<VoteSubPage> {

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
        Expanded(child: CandidateListBuilder(candidateList: widget.event.candidateList)),
      ],
    );
  }
}

class CandidateListBuilder extends StatefulWidget {
  final List<Candidate>? candidateList;
  const CandidateListBuilder({Key? key, this.candidateList}) : super(key: key);

  @override
  State<CandidateListBuilder> createState() => _CandidateListBuilderState();
}

class _CandidateListBuilderState extends State<CandidateListBuilder> {

  void onCardClicked(Candidate candidate){
    print(candidate.id);
    //PostSelectedCandidate
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      itemCount: widget.candidateList!.length,
      itemBuilder: ((context, index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
                tileColor: Color.fromARGB(255, 181, 210, 224),
                title: Text(widget.candidateList![index].name),
                subtitle: Text( widget.candidateList![index].party),
                onTap: (() =>  onCardClicked(widget.candidateList![index])),
              ),
        );
        }
      ),
    );
    
  }
}