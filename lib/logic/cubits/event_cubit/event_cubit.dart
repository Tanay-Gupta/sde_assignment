import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sde_assignment/logic/cubits/event_cubit/event_state.dart';

import '../../../data/models/all_event_model.dart';
import '../../../data/models/repositories/all_event_repository.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventLoadingState()) {
    fetchEvents();
  }

  AllEventRepository eventRepository = AllEventRepository();

  void fetchEvents() async {
    try {
      List<AllEventModel> allEventModels = await eventRepository.fetchEvents();
      emit(EventLoadedState(allEventModels));
    } catch (ex) {
      emit(EventErrorState(ex.toString()));
    }
  }
}
