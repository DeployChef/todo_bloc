part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class SuccessfullLoginState extends HomeState {
  final String username;

  const SuccessfullLoginState(this.username);

  @override
  List<Object?> get props => [username];
}

class RegisteringServicesState extends HomeState {}
