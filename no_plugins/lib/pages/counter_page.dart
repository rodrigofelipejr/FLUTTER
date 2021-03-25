import 'package:flutter/material.dart';
import 'package:no_plugins/controllers/counter_controller.dart';
import 'package:no_plugins/models/counter_model.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterController _counterController = CounterController();

  CounterModel counter = CounterModel(count: 0);

  final snackBar = SnackBar(
    content: Text('Error while trying to get the counter data'),
  );

  @override
  void initState() {
    super.initState();
    _initCounter();
  }

  void _initCounter() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _counterController.setResponseResultHandler(_onCounterResponse);
      _counterController.setResponseErrorHandler(_onResponseError);
    });
  }

  void _onCounterResponse(CounterModel counter) {
    setState(() {
      this.counter = counter;
    });
  }

  void _onResponseError() {
    final snackBar = SnackBar(content: Text('Error'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("No Plugin Example"),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You have pushed the button this many times"),
                Text(
                  "${counter.count}",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  counter.increment();
                });
              },
              tooltip: "Increment",
              child: Icon(Icons.add),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  counter.decrement()();
                });
              },
              tooltip: "Decrement",
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
