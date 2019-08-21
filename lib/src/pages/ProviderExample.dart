import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/Counter.dart';
import '../provider/User.dart';

class ProviderExample extends StatefulWidget {
  @override
  _ProviderExampleState createState() => _ProviderExampleState();
}

class _ProviderExampleState extends State<ProviderExample> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            builder: (_) => Counter(),
          ),
          ChangeNotifierProvider(
            builder: (_) => User(),
          )
        ],
        child: Builder(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Column(
                      children: <Widget>[
                        Text('counter'),
                        Consumer<Counter>(
                            builder: (conext, value, child) => Text(
                                  value.getCount().toString(),
                                  style: TextStyle(fontSize: 30),
                                )),
                        Text('users'),
                        RaisedButton(
                          onPressed: () {
                            Provider.of<User>(context, listen: false)
                                .fetchUsers();
                          },
                          child: Text("Fetch Users"),
                        ),
                        Consumer<User>(builder: (context, value, child) {
                          return Column(
                              children: value.getUsers().map((item) {
                            return Text(
                                item['id'].toString() + '. ' + item['name']);
                          }).toList());
                        }),
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () =>
                        Provider.of<Counter>(context, listen: false)
                            .incrementCount(),
                    child: Icon(Icons.add),
                  ),
                )));
  }
}
