import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/first_cotroller.dart';


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {

    final firstState = Get.find<FirstController>();

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Second Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Obx(
                ()=> Text(
                  "${firstState.counter}",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ElevatedButton(onPressed:(){
                Get.back();
              }, child: Text("Go to back"))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            firstState.incrementCounter();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        )
    );
  }
}
