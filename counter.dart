import "package:flutter/material.dart";

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int num =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("counter page"),
      ),
      body: Center(
        child: Text('number of times button clicked:$num'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            num++;
          });
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
    );
  }
}

