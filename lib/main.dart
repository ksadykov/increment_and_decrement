import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  int? _counter;
  int? _decrimetcounter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          '"инкремент и декремент"',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '-------------------------------------',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterLoading) {
                  return const CircularProgressIndicator.adaptive();
                }
                if (state is CounterSuccess) {
                  _counter = state.counter;
                  _decrimetcounter = state.counter;
                  return Text(
                    '${state.counter}',
                    style: const TextStyle(color: Colors.blue, fontSize: 25),
                  );
                }
                if (state is DecrimetCounterSuccess) {
                  return Text(
                    '${state.decrimetcounter}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return Text(
                  '${_counter ?? 0}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const Text('-------------------------------------'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(IncrimentEvent(counter: _counter ?? 0));
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context).add(DecrimentEvent(
                          decrimentcounter: _decrimetcounter ?? 0));
                    },
                    tooltip: 'Decriment',
                    child: const Icon(Icons.remove),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
