import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/first_cotroller.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  final firstState = Get.find<FirstController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("First Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(()=>
              Text(
                "${firstState.counter}",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(onPressed:(){
              //Get.off(const SecondPage());
              Get.toNamed('second-page');
              //print(service.value);
              //print(service.value);
            }, child: Text("Go to"))
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.snackbar("Title",snackPosition: SnackPosition.BOTTOM,"Message body");
            // firstState.incrementCounter();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        )
    );
  }
}
