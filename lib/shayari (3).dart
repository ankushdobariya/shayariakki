import 'package:flutter/material.dart';
import 'package:shayariakki/data%20(5).dart';
import 'package:shayariakki/one%20(5).dart';



class two extends StatefulWidget {
  int? pos;
  String? catname;




  two(this.pos,this.catname,);

  @override
  _twoState createState() => _twoState();
}
class _twoState extends State<two> {

  List templist=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.pos==0)
    {
      templist=data.loveshayri;
    }
    if(widget.pos==1)
    {
      templist=data.dostishari;
    }
    if(widget.pos==2)
    {
      templist=data.friendshayri;
    }
    if(widget.pos==3)
    {
      templist=data.sadshayri;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.catname}"),),
      body: ListView.builder(
        itemCount: templist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Card(child: ListTile(title: Text(templist[index]),),),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return one(index,templist,"singleclr");
            },));
          },
          );

        },),
    );
  }
}
