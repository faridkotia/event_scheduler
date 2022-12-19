import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEvent extends StatefulWidget {
  final Function addEve;
  NewEvent(this.addEve);

  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  final _eventController = TextEditingController();
  DateTime _selecteDate;
  void _submitData() {
    final enteredEvent = _eventController.text;
    if (enteredEvent.isEmpty || _selecteDate == null) {
      return;
    }
    widget.addEve(
      enteredEvent,
      _selecteDate,
    );
    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selecteDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Enter Event'),
              style: const TextStyle(fontSize: 19),
              controller: _eventController,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text(
                    _selecteDate == null
                        ? 'No Date Chosen!'
                        : DateFormat.yMMMd().format(_selecteDate),
                    style: const TextStyle(fontSize: 18),
                  ),
                  TextButton(
                    onPressed: _datePicker,
                    child: const Text(
                      'Choose Date',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text('Add Event', style: TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}
