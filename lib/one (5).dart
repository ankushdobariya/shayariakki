import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayariakki/data%20(5).dart';
import 'package:shayariakki/datasize.dart';
import 'package:shayariakki/two%20(2).dart';



class one extends StatefulWidget {
  int aa;
 List templist;
 String singlclr;
 one(this.aa,this.templist,this.singlclr);

  @override
  _oneState createState() => _oneState();
}

class _oneState extends State<one> {

  // List templist=[];
  // Color usclr=Colors.blueGrey;
  List<Color> gclr=data.Tclr[0];

  PageController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=PageController(
      initialPage: widget.aa
    );

  }

  @override
  Widget build(BuildContext context) {
    sizedeta(context);
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               IconButton(onPressed: () {
                 showModalBottomSheet(context: context, builder: (context) {
                   return Container(
                     height: sizedeta.bdheight,
                     child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 6,
                       mainAxisSpacing: 10,
                       crossAxisSpacing: 10,
                     ),
                       itemCount: data.Tclr.length,
                       itemBuilder: (context, index) {
                         return InkWell(
                           onTap: () {
                             setState(() {
                               widget.singlclr="gradient";
                               gclr=data.Tclr[index];
                             });
                             Navigator.pop(context);
                           },
                           child: Container(
                             decoration: BoxDecoration(
                               gradient: LinearGradient(
                                 colors: data.Tclr[index]
                               )
                             ),
                           ),
                         );
                       },),
                   );
                 },);
               }, icon:  Icon(Icons.shuffle,size: 20,),),
                Text(" ${widget.aa+1}/${widget.templist.length}"),
               IconButton(onPressed: () {
                 setState(() {
                   widget.singlclr="gradient";
                   data.Tclr.shuffle();
                   gclr=data.Tclr[1];
                 });
               }, icon:  Icon(Icons.repeat,size: 20,))
              ],
            ),
            Container(alignment: Alignment.center,
              height: (sizedeta.height!-20)/3,
              width: (sizedeta.width!)/1.5,
              decoration: BoxDecoration(
                color: widget.singlclr=="singleclr"?Colors.black26:null,
                gradient:widget.singlclr=="gradient"?LinearGradient(
                  colors: gclr
                ):null
              ),
              child:PageView.builder(
                controller: controller,
                itemCount: widget.templist.length,
                onPageChanged: (value) {
                  setState(() {
                      widget.aa=value;
                  });
                },
                itemBuilder: (context, index) {
                return  Text(widget.templist[index]);
              },)
             ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(

                  height: (sizedeta.height!-50)/3,
                  width: sizedeta.width!-10,
                  child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround
                  ,
                  children: [
                    IconButton(onPressed: () {
                      FlutterClipboard.copy('hello flutter friends${widget.templist[widget.aa]}').then(( value ){
                        Fluttertoast.showToast(
                            msg: "Copied successfully",

                        );
                      });
                    }, icon: Icon(Icons.copy)),
                    IconButton(onPressed: () {

                      setState(() {
                        if(widget.aa>0)
                          {
                            widget.aa=widget.aa-1;
                            controller!.jumpToPage(widget.aa);
                          }
                      });
                    }, icon: Icon(Icons.skip_previous)),

                    IconButton(onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return three(widget.aa, widget.templist,"singleclr");
                      },));
                    }, icon: Icon(Icons.edit)),

                    IconButton(onPressed: () {

                      setState(() {
                        if(widget.aa<widget.templist.length-1)
                          {
                            widget.aa=widget.aa+1;
                            controller!.jumpToPage(widget.aa);
                          }
                      });
                    }, icon: Icon(Icons.skip_next)),

                    IconButton(onPressed: () {
                      Share.share('${widget.templist[widget.aa]}check out my website https://example.com');
                    }, icon: Icon(Icons.share)),
                  ],
                ),
                ),
              ],
            ),
          ],
        ),
      )

    );
  }
}
