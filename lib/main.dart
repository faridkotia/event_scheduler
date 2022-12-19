import 'package:flutter/material.dart';
import './Widgets/new_event.dart';
import './Widgets/event_list.dart';
import './Models/event.dart';

void main() => runApp(MyApps());

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Schduler',
      theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'Quicksand',
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  final List<Event> _events = [];

  void _addNewEvent(String n_eve, DateTime chosenDate) {
    final newEv = Event(
      event: n_eve,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _events.add(newEv);
    });
  }

  void _startAddingNewEvent(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          child: NewEvent(_addNewEvent),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteEvent(String id) {
    setState(() {
      _events.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Schduler'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            EventList(_events, _deleteEvent),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.calendar_month_outlined),
        onPressed: () => _startAddingNewEvent(context),
      ),
    );
  }
}
