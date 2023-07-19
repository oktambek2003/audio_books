import 'package:flutter/material.dart';
import 'dart:convert';
import './app_colors.dart' as ApColors;
class AppTab1 extends StatefulWidget {
  const AppTab1({super.key});

  @override
  State<AppTab1> createState() => _AppTab1State();
}

class _AppTab1State extends State<AppTab1> {
  late List Books;
  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/books.json')
        .then((value) {
      setState(() {
        Books = json.decode(value);

      });
    });
  }

  @override
  void initState() {
    super.initState();
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:Books==null?0:Books.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color:ApColors.backraund ,
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    offset: Offset(0, 0),
                    color: Colors.grey.withOpacity(0.2)),
              ]),
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              
              children: [
                Container(
                    width: 90,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(Books[index]["img"]),fit: BoxFit.cover),
                    )),SizedBox(width: 10,),
                    Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(children: [
                        Icon(Icons.star,color:ApColors.starColor,),
                        Text(Books[index]["rating"],style: TextStyle(color: ApColors.MenuColor2),)
                      ],)
                    ,Text(Books[index]["title"],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                         ,Text(Books[index]["text"],style: TextStyle(fontSize: 16,color: const Color.fromARGB(77, 189, 48, 48)),),
                         Container(width: 60,height: 20,
                         alignment: Alignment.center  ,
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),  color: ApColors.MenuColor3,),
                         child: Text("Love",style: TextStyle(fontSize: 12,color: Colors.white),),
                       
                         )
                    ],)
              ],
            ),
          ),
        );
      },
    );
  }
}
