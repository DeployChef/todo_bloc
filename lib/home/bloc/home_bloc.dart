import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/services/auth.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthService _auth;

  HomeBloc(this._auth) : super(HomeInitial()) {
    on<LoginEvent>((event, emit) async {
      final user = await _auth.authUser(event.username, event.password);
      if (user != null) {
        emit(SuccessfullLoginState(user));
      }
    });
  }
}
