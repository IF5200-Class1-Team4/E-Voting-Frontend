import 'package:e_voting_frontend/voting/candidate.dart';
import 'package:e_voting_frontend/voting/event.dart';
import 'package:flutter/material.dart';

class VoteSubPage extends StatefulWidget {
  final VotingEvent event;
  final void Function(Candidate)? callback;
  const VoteSubPage({Key? key, required this.event, this.callback}) : super(key: key);

  @override
  State<VoteSubPage> createState() => _VoteSubPageState();
}

class _VoteSubPageState extends State<VoteSubPage> {

  @override
  Widget build(BuildContext context) {
    return CandidateListBuilder(candidateList: widget.event.candidateList, callback: widget.callback);
  }
}

class CandidateListBuilder extends StatefulWidget {
  final List<Candidate>? candidateList;
  final void Function(Candidate)? callback;
  const CandidateListBuilder({Key? key, this.candidateList, this.callback}) : super(key: key);

  @override
  State<CandidateListBuilder> createState() => _CandidateListBuilderState();
}

class _CandidateListBuilderState extends State<CandidateListBuilder> {

  void onCardClicked(Candidate candidate){
    print(candidate.id);
    if(widget.callback != null){
      widget.callback!(candidate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: widget.candidateList!.length,
      itemBuilder: ((context, index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
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