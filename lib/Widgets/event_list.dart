import 'package:flutter/material.dart';
import '../Models/event.dart';
import 'package:intl/intl.dart';

class EventList extends StatelessWidget {
  final List<Event> events;
  final Function deleteEvent;
  EventList(this.events, this.deleteEvent);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreenAccent,
      height: 815,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            child: Card(
              color: Colors.amber,
              elevation: 10,
              child: ListTile(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                title: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  child: Text(
                    DateFormat.yMMMd().format(events[index].date),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                subtitle: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  child: Text(
                    events[index].event,
                    style: const TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  iconSize: 40,
                  onPressed: () => deleteEvent(events[index].id),
                ),
              ),
            ),
          );
        },
        itemCount: events.length,
      ),
    );
  }
}
