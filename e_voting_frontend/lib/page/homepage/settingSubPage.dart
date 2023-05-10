
import 'package:e_voting_frontend/utility/httpCommunication.dart';
import 'package:flutter/material.dart';

class electionSettingPage extends StatelessWidget {
  Map<String, TextEditingController> controllerList = {};
  HttpCommunication http = HttpCommunication();

  Widget makeInput({label, obsureText = false}){
  var controller = TextEditingController();
  controllerList[label] = controller;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      SizedBox(height: 5,),
      TextField(
        obscureText: obsureText,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400]!,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!)
          ),
        ),
      ),
      SizedBox(height: 30,)

    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const[
                        Text ("Election Setting Page", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 30,)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: Column(
                        children: [
                          makeInput(label: "Start Date"),
                          makeInput(label: "End Date"),
                          makeInput(label: "Election Name"),
                          // makeInput(label: "Password",obsureText: true),
                          // makeInput(label: "Confirm Pasword",obsureText: true)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3,left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black)
                            )
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height:60,
                          onPressed: (){
                            print(controllerList["Start Date"]!.text);
                            print(controllerList["End Date"]!.text);
                            print(controllerList["Election Name"]!.text);
                            http.PostEventSync(100, 100, controllerList["Election Name"]!.text);
                          },
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: Text("Submit Setting",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16,

                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class candidateSettingPage extends StatelessWidget {
  Map<String, TextEditingController> controllerList = {};
  HttpCommunication http = HttpCommunication();

  Widget makeInput({label, obsureText = false}){
  var controller = TextEditingController();
  controllerList[label] = controller;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      SizedBox(height: 5,),
      TextField(
        obscureText: obsureText,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[400]!,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!)
          ),
        ),
      ),
      SizedBox(height: 30,)

    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const[
                        Text ("Election Setting Page", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 30,)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: Column(
                        children: [
                          makeInput(label: "Name"),
                          makeInput(label: "Party"),
                          // makeInput(label: "Password",obsureText: true),
                          // makeInput(label: "Confirm Pasword",obsureText: true)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3,left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black)
                            )
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height:60,
                          onPressed: (){
                            print(controllerList["Name"]!.text);
                            print(controllerList["Party"]!.text);
                            http.PostCandidateSync(controllerList["Name"]!.text, controllerList["Party"]!.text, 1);
                          },
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: Text("Submit Setting",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16,

                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}