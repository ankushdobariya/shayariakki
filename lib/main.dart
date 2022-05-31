import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayariakki/data%20(5).dart';
import 'package:shayariakki/datasize.dart';
import 'package:shayariakki/popup.dart';
import 'package:shayariakki/shayari%20(3).dart';


void main()
{

  runApp(MaterialApp(
      home: shayari()
  ));
}
class shayari extends StatefulWidget {
  @override
  _shayariState createState() => _shayariState();
}
class _shayariState extends State<shayari> {

  permission() async
  {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    print(statuses[Permission.storage]);
    var status = await Permission.storage.status;
    if(status.isGranted)
    {
      createFolder().then((value){
        print(value);
        setState(() {
          data.folderpath=value;
        });
      });
    }
    else
    {
      permission();
    }
  }
  Future<String> createFolder() async {
    final foldername = "My folder";
    var defaultpath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
    final path = Directory("$defaultpath/$foldername");
    var status = await Permission.storage.request();

    if ((await path.exists())) {
      return path.path;
    }
    else {
      path.create();
      return path.path;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permission();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("shayari"),
          actions: [
          PopupMenuButton(
            offset:Offset(10,40),
            onSelected: (value) {
            if(value==1)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return popup();
                  },));

              }
            if(value==2)
            {

            }
            if(value==3)
            {
              print("help");
            }if(value==4)
            {
              print("info");
            }

          },
            itemBuilder: (context) => [
    PopupMenuItem(child: Text("Setting"),value: 1,),
    PopupMenuItem(child: Text("Logout"),value: 2,),
    PopupMenuItem(child: Text("Help"),value: 3,),
    PopupMenuItem(child: Text("Info"),value: 4,),
    ],)]),
      body: ListView.builder(
        itemCount: data.imglist.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(data.catlist[index]),
              leading: Container(
                height: sizedeta.height,
                width: sizedeta.width,
                child: Image.network(data.imglist[index]),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return two(index, data.catlist[index]);
                },));
              },
            ),
          );
        },),
    );
  }
}
