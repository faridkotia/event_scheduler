import 'package:flutter/foundation.dart';

class Event {
  final String id;
  final String event;
  final DateTime date;

  Event({
    @required this.id,
    @required this.event,
    @required this.date,
  });
}
