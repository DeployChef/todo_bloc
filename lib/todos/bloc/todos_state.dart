part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState {}

class TodosLoadedState extends TodosState {
  final List<Task> tasks;

  TodosLoadedState(this.tasks);

  @override
  List<Object> get props => [tasks];
}
