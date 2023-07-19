import 'package:sde_assignment/data/models/all_event_model.dart';

abstract class EventState {}

class EventLoadingState extends EventState {}

class EventLoadedState extends EventState {
  final List<AllEventModel> events;
  EventLoadedState(this.events);
}

class EventErrorState extends EventState {
  final String error;
  EventErrorState(this.error);
}
