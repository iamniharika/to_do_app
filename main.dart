// import 'dart:js_util';

import 'package:flutter/material.dart';

void main(){
  runApp(app());
}

class app extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home:  homscreen(),
    );
  }

}
class homscreen extends StatefulWidget{
  @override
  State<homscreen> createState() => _homscreenState();
}

class _homscreenState extends State<homscreen> {

List todolist = [];
String singlevalue = "";

addString(content){
  setState(() {
    singlevalue = content;
  });
}

addlist(){
  setState(() {
    todolist.add({"value": singlevalue});
  });
}

deleteitem(index){
  setState(() {
    todolist.removeAt(index);
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text("To Do Application !!")),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 90,
              child: ListView.builder(itemCount: todolist.length ,itemBuilder: (context , index){
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    border: Border.all(color: Colors.indigo , width: 5)
                  ),
                  
                  child: Row(
                    children: [
                      Expanded(
                        flex: 80,
                        child: Text(todolist[index]['value'].toString())),
                      Expanded(
                        flex: 20,
                        child: TextButton(onPressed: (){
                          deleteitem(index);
                        }, child: Icon(Icons.delete , color: Colors.indigo,))
                          
                         )
                    ],
                  ),
                );
              }),
              ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 70,
                    child: Container(
                      height: 80,
                      child: TextFormField(
                        
                        onChanged: (content){
                          addString(content);
                        },

                        decoration: InputDecoration(
                  
                          fillColor: Colors.pink,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)
                          ),
                          labelText: "create task"
                          ,
                        ),
                      ),
                    )),
                  Expanded(
                    flex: 2,
                    child: SizedBox(width: 40)),
                  Expanded(
                    flex: 27,
                    child: ElevatedButton(
                      onPressed: (){
                        addlist();
                    }, child: Text("add task"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),))
                ],
              ))
          ],
        ),
      )
    );
  }
}