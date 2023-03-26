import 'package:e_voting_frontend/candidate/candidate.dart';
import 'package:flutter/material.dart';

class CandidateList extends StatefulWidget {
  final List<Candidate>? candidateList;
  final void Function(Candidate)? callback;
  const CandidateList({Key? key, this.candidateList, this.callback}) : super(key: key);

  @override
  State<CandidateList> createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CandidateListBuilder(candidateList: widget.candidateList, callback: widget.callback),
    );
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
    // candidateList.add(bleDevice1);
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