//--no-sound-null-safety
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main() => runApp(new MaterialApp(
home: HomePage(),
));

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
 // final String url="https://run.mocky.io/v3/78a8c6f3-59cb-4f0a-a196-0f5ee1c794bc";
  List data=['yvbjg'];
  var url=Uri.parse('http://run.mocky.io/v3/78a8c6f3-59cb-4f0a-a196-0f5ee1c794bc');
  @override
  void initSate(){
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{
    var response = await http.get(url,
      
      //headers: {"Accept":"application/json"}
    );
    print(response.body);

    setState(() {
      var convertTOjson =json.decode(response.body);
      
        data = convertTOjson['users'];
        print(data);
    });
    return "Success";
  }


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrieve json data"),
      ),
      body:ListView.builder(  
        itemCount:data==null?0:data.length ,
        itemBuilder:(BuildContext context, int index) {
          return Container(
            child: Center(
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              Card(
                child: Container(
                  child: Text(data[index]['name']),
                  padding: const EdgeInsets.all(16),
                )
              )
              ],)
            ),
          );
        }  )
    );
  }
}