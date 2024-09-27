import 'package:flutter_bloc/flutter_bloc.dart';
import 'user.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        // Simulated data fetching
        await Future.delayed(Duration(seconds: 2));
        final user = User(id: event.userId, name: 'Dhanvina');
        emit(UserLoaded(user));
      } catch (e) {
        emit(UserError('Failed to load user'));
      }
    });
  }
}
