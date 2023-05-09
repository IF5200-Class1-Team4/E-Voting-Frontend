import 'package:e_voting_frontend/utility/httpCommunication.dart';
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
        Expanded(child: CandidateListBuilder(event: widget.event)),
      ],
    );
  }
}

class CandidateListBuilder extends StatefulWidget {
  final VotingEvent event;
  const CandidateListBuilder({Key? key, required this.event}) : super(key: key);

  @override
  State<CandidateListBuilder> createState() => _CandidateListBuilderState();
}

class _CandidateListBuilderState extends State<CandidateListBuilder> {
  HttpCommunication http = HttpCommunication();
  void onCardClicked(Candidate candidate){
    print(candidate.id);
    http.PostVoteSync(widget.event.id, candidate.id);
    //PostSelectedCandidate
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      itemCount: widget.event.candidateList.length,
      itemBuilder: ((context, index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
                tileColor: Color.fromARGB(255, 181, 210, 224),
                title: Text(widget.event.candidateList[index].name),
                subtitle: Text( widget.event.candidateList[index].party),
                onTap: (() =>  onCardClicked(widget.event.candidateList[index])),
              ),
        );
        }
      ),
    );
    
  }
}