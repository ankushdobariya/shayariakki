
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayariakki/data%20(5).dart';
import 'package:shayariakki/datasize.dart';
import 'dart:ui' as ui;


class three extends StatefulWidget {
  int aa;
  List templist;
  String singleclr;
  three(this.aa,this.templist,this.singleclr);

  @override
  _threeState createState() => _threeState();
}


class _threeState extends State<three> {
  double cvalue=30;
  String emoji="";
  String font1="";
  Color usclr=Colors.green;
  Color txclr=Colors.black;
  List<Color> gclr=[Colors.black,Colors.white];
  GlobalKey _globalKey = new GlobalKey();

  Future<Uint8List> _capturePng() async {
    var pngBytes;
    try {
      print('inside');
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      pngBytes = byteData!.buffer.asUint8List();
    } catch (e) {

    }
    return pngBytes;
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("Edit shayari"),),
      body: Container(
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           RepaintBoundary(
          key: _globalKey,
            child:   Container(alignment: Alignment.center,
          height: (sizedeta.height!-100)/2,
          width: sizedeta.width!-100,
          // margin: EdgeInsets.all(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.singleclr=="singleclr"?usclr:null,
            gradient: widget.singleclr=="gradient"?LinearGradient(colors: gclr):null
          ),
          child: Text("$emoji${widget.templist[widget.aa]}",style: TextStyle(fontSize: cvalue,fontFamily: "${font1}",color: txclr),),
        ),
        ),


            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(alignment: Alignment.center,
                    height: (sizedeta.height!-100)/15,
                    width: (sizedeta.width!-60)/3,

                    child: Icon(Icons.refresh),
                    //margin: EdgeInsets.all(10),
                  ),
                  onTap: () {
                    showModalBottomSheet(context: context, builder: (context) {
                      return Container(
                        height: 150,
                        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                            itemCount: data.Tclr.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                   widget.singleclr="gradient";
                                    gclr=data.Tclr[index];
                                  });
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: data.Tclr[index])
                                  ),
                                ),`
                              );
                            },),
                      );
                    },);
                  },
                ),
                InkWell(
                  child: Container(alignment: Alignment.center,
                    height: (sizedeta.height!-100)/15,
                    width: (sizedeta.width!-60)/3,

                    child: Icon(Icons.zoom_out_map),
                    //margin: EdgeInsets.all(10),
                  ),
                  onTap: () {
                    setState(() {
                      widget.singleclr="gradient";
                      data.Tclr.shuffle();
                      gclr=data.Tclr[0];
                    });
                  },
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(alignment: Alignment.center,
                    height: (sizedeta.height!-100)/15,
                    width: (sizedeta.width!-60)/3,
                    //color: Colors.blueGrey,
                   // margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey,
                    ),
                    child: Text("Background"),
                  ),
                  onTap: () {
                    showModalBottomSheet(

                      context: context, builder: (context) {
                    return Container(
                      height: 200,
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,crossAxisSpacing: 10,mainAxisSpacing: 10),
                        itemCount: data.color.length,
                        itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              widget.singleclr="singleclr";
                              usclr=data.color[index];
                            });

                          },
                          child: Container(
                            color: data.color[index],
                          ),
                        );
                      },),
                    );


                  },);

                  },
                ),
                InkWell(
                  child: Container(alignment: Alignment.center,
                    height: (sizedeta.height!-100)/15,
                    width: (sizedeta.width!-60)/3,
                    //color: Colors.blueGrey,
                  //  margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey,
                    ),
                    child: Text("Text Color"),
                  ),
                  onTap: () {
                    showModalBottomSheet(

                      context: context, builder: (context) {
                      return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,crossAxisSpacing: 10,mainAxisSpacing: 10),
                        itemCount: data.color.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                txclr=data.color[index];
                              });

                            },
                            child: Container(
                              color: data.color[index],
                            ),
                          );
                        },);


                    },);

                  },
                ),
                InkWell(
                  child: Container(alignment: Alignment.center,
                    height: (sizedeta.height!-100)/15,
                    width: (sizedeta.width!-60)/3,
                   // color: Colors.blueGrey,
                  //  margin: EdgeInsets.all(10 ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey,
                    ),
                    child: Text("Share"),
                  ),
                  onTap: () {

                    _capturePng().then((imgbyte) {
                      var now = DateTime.now();
                      var formatterDate = DateFormat('ddMMyy');
                      String actualDate = formatterDate.format(now);
                      print(actualDate);
                      String time=("${now.hour.toString()}${now.minute.toString()}${now.microsecond.toString()}");
                      String imgname="IMG_${actualDate}${time}";
                      File f=File("${data.folderpath}/$imgname.jpg");
                      f.create().then((value) {
                        f.writeAsBytes(imgbyte).then((value) {

                          Share.shareFiles(['${value.path}']);
                        });
                      });
                      // showModalBottomSheet(context: context, builder: (context)
                      // {
                      //   return Image.memory(imgname, height: 150,);
                      // });

                    });
                  },
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(alignment: Alignment.center,
                    height: (sizedeta.height!-100)/15,
                    width: (sizedeta.width!-60)/3,
                    //color: Colors.blueGrey,
                    //margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey,
                    ),
                    child: Text("font"),
                  ),
                  onTap: () {
                   showModalBottomSheet(context: context, builder: (context) {
                     return Container(
                       height: 100,
                       child: ListView.builder(
                         itemCount: data.font.length,
                         itemBuilder: (context, index) {
                         return InkWell(
                           onTap: () {
                             setState(() {
                               font1=data.font[index];
                             });
                           },
                           child: Text("${data.font[index]}",style: TextStyle(fontSize: 30,fontFamily: data.font[index]),),
                         );
                       },),
                     );
                   },);
                  },
                ),
                InkWell(
                  child: Container(alignment: Alignment.center,
                    height: (sizedeta.height!-100)/15,
                    width: (sizedeta.width!-60)/3,
                    //color: Colors.blueGrey,
                   // margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey,
                    ),
                    child: Text("Textsize"),
                  ),
                  onTap: () {
                    showModalBottomSheet(context: context, builder: (context) {
                      return Container(
                        height: 100,
                        child: StatefulBuilder(builder: (context, setState1) {
                          return Slider(value: cvalue, onChanged: (value) {

                            setState((){
                              setState1((){
                                cvalue=value;
                              });
                            });
                          },
                          min: 10,
                          max: 50,);
                        },),
                      );
                    },);
                  },
                ),
                InkWell(
                  child: Container(alignment: Alignment.center,
                    height: (sizedeta.height!-100)/15,
                    width: (sizedeta.width!-60)/3,
                   // color: Colors.blueGrey,
                   // margin: EdgeInsets.all(10 ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey,
                    ),
                    child: Text("Emoji"),
                  ),
                  onTap: () {
                    showModalBottomSheet(context: context, builder: (context) {
                      return Container(
                        height: 100,
                        child: ListView.builder(
                          itemCount: data.emoji.length,
                          itemBuilder: (context, index) {

                            return InkWell(
                              onTap: () {
                                setState(() {
                                  emoji=data.emoji[index];
                                });
                              },
                              child: Text("${data.emoji[index]}",style: TextStyle(fontSize: 40),),
                            );
                        },),
                      );
                    },);
                  },
                )



              ],
            ),
          ],
        ),
      ),
    );
  }
}


