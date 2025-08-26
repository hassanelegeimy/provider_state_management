import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/counter_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: ChangeNotifierProvider(
        create: (BuildContext context) => CounterController(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("Hassan build MyHomePage");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Consumer(
              builder: (BuildContext context, CounterController value, Widget? child) {
                print("change  counter text");
                return Text('${value.counter}', style: Theme.of(context).textTheme.headlineMedium);
              },
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextFormField(controller: userNameController),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<CounterController>().setUserName(userNameController.text);
              },
              child: Text("save username"),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextFormField(controller: ageController),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<CounterController>().setAge(ageController.text);
              },
              child: Text("save age"),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Selector(
                  selector: (BuildContext context, CounterController controller) {
                    return controller.userName ?? "None";
                  },
                  builder: (BuildContext context, String? userName, Widget? child) {
                    print("change username");
                    return Text("$userName");
                  },
                ),
                Selector(
                  selector: (BuildContext context, CounterController controller) {
                    return controller.age ?? "None";
                  },
                  builder: (BuildContext context, String? age, Widget? child) {
                    print("change age");
                    return Text("$age");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterController>().incrementCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterController>().decrementCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.minimize),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
