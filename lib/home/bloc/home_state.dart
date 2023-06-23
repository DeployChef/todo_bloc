part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object?> get props => [];
}

class SuccessfullLoginState extends HomeState {
  final String username;

  const SuccessfullLoginState(this.username);

  @override
  List<Object?> get props => [username];
}
