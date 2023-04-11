import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget{
  static const String routeName = 'counter';

  CounterWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CounterState();
}

class CounterState  extends State<StatefulWidget>{
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculator', style:  TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$counter', style: TextStyle(fontSize: 28),),
              ElevatedButton(onPressed: (){
                counter++;
                print(counter);
                setState((){});

              }, child: Icon(Icons.add))
            ],
          ),
        )
    );

  }

}

/*
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator', style:  TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter', style: TextStyle(fontSize: 28),),
            ElevatedButton(onPressed: (){
              counter++;
              print(counter);
            }, child: Icon(Icons.add))
          ],
        ),
      )
    );

 */