import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/services/auth.dart';
import 'package:todo_bloc/services/todo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthService _auth;
  final TodoService _todo;

  HomeBloc(this._auth, this._todo) : super(HomeInitial()) {
    on<LoginEvent>((event, emit) async {
      final user = await _auth.authUser(event.username, event.password);
      if (user != null) {
        emit(SuccessfullLoginState(user));
        emit(HomeInitial());
      }
    });

    on<RegisterServiceEvent>((event, emit) async {
      await _auth.init();
      await _todo.init();

      emit(HomeInitial());
    });
  }
}
