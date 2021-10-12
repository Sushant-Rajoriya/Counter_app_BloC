import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/counter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("BloC counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 20),
            ),
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    counterBloc.add(CounterEvent.decrement);
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    counterBloc.add(CounterEvent.increment);
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
